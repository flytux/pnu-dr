/**
 * datepicker 설정
 */
$.datepicker.regional['ko'] = {
	changeMonth: true, // 월선택 select box 표시 (기본은 false)
	changeYear: true,  // 년선택 select box 표시 (기본은 false)
	showOtherMonths: true, //다음,이전 달 날짜 보이기       
	showOn: "both", //달력아이콘 보이기
	buttonImageOnly: false,
	buttonText: "<i class='bi bi-calendar-event'>",
	prevText: '이전',
	nextText: '다음',
	currentText: '오늘',
	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	dateFormat: 'yy-mm-dd',
	firstDay: 0,
	yearRange: 'c-10:c+10',
	isRTL: false,
	showMonthAfterYear: true,
	showButtonPanel: true,
	closeText: '초기화',
	onClose: function(dateText, obj) {
		if ($(window.event.srcElement).hasClass("ui-datepicker-close")) {
			$.datepicker._clearDate(this);
		}
	},
	beforeShow: function(input, inst) {
		$(input).datepicker('widget').removeClass('hide-calendar');
	},
	yearSuffix: '년'
};
$.datepicker.setDefaults($.datepicker.regional['ko']);

$.fn.ListViewDataTable = function(params) {
	var objTag = $(this);
	var obj = {};
	var objId = "";

	if (gfn_com_isEmptyObject(objTag) || objTag.length == 0) {
		console.log("바인딩 할 Table이 없습니다.");
		return;
	}

	var conditionStr = "";
	var conditionMatch = "";
	var conditionStartIdx = 0;
	var conditionFlg = false;

	switch ($(objTag).prop("tagName").toUpperCase()) {
		case "TABLE":
			obj = $(objTag).find("tbody");
			objId = $(objTag).attr("id") + "_tbody";
			$(obj).attr("id", objId);
			break;
		case "TBODY":
			obj = objTag;
			objId = $(objTag).attr("id");
			break;
		default:
			break;
	}
	if ($(".panel-default").length > 0) {
		$($(obj).closest("table")).insertAfter(".search-form");
		$(".panel-default").remove();
	}

	$(obj).find("tr").remove();

	if ((gfn_com_isEmptyObject(params.dataSource) || params.dataSource.length == 0) && params.comment != "_") {
		if (params.grid) {
			$(obj).append("<tr><td colspan='" + $(obj).closest(".gri-tbl-wrap").find(".grid-header-tbl col").length + "' class='text-center grid-content'>검색된 데이터가 없습니다.</td></tr>");
		} else {
			$(obj).append("<tr><td colspan='" + $(obj).closest("table").find("thead th").length + "' class='text-center'>검색된 데이터가 없습니다.</td></tr>");
		}
	} else {
		$.each(params.dataSource, function(index, item) {
			var templateArr = $(params.template).html().split("#");
			for (var idx = 0; idx < templateArr.length; idx++) {
				if (templateArr[idx] != null && templateArr[idx].trim().indexOf(":") == 0) {
					if (item[templateArr[idx].trim().substr(1)] != null && (item[templateArr[idx].trim().substr(1)] + '').length > 0) {
						templateArr[idx] = gfn_str_parseNull(item[templateArr[idx].trim().substr(1)]);
					} else {
						templateArr[idx] = "";
					}
				} else if (templateArr[idx] != null && templateArr[idx].trim().indexOf("if") == 0) {

					conditionStr = (templateArr[idx].replace(/(\s*)/g, ""));
					conditionMatch = conditionStr.match(/:([a-zA-Z0-9])+/g);

					for (var idx_ = 0; idx_ < conditionMatch.length; idx_++) {
						conditionStr = gfn_str_replaceAll(conditionStr, conditionMatch[idx_], '"' + item[conditionMatch[idx_].substr(1)] + '"');
					}
					conditionStartIdx = (idx + 1);
					conditionFlg = (new Function('return ' + conditionStr.substring(3, conditionStr.length - 2)))();

				} else if (templateArr[idx] != null && templateArr[idx].trim().indexOf("}") == 0) {

					if (!conditionFlg) {
						for (var idx__ = conditionStartIdx - 1; idx__ <= idx; idx__++) {
							templateArr[idx__] = "";
						}
					} else {
						templateArr[conditionStartIdx - 1] = "";
						templateArr[idx] = "";
					}

				} else if (idx > 0 && templateArr[idx - 1] != null && templateArr[idx - 1].substr(templateArr[idx - 1].length - 2) == "__") {
					templateArr[idx - 1] = templateArr[idx - 1].substr(0, templateArr[idx - 1].length - 2) + "#";
				}
			}
			$(obj).append($(templateArr.join('')).data(item));
		});
	}

	if (typeof params.dataBound == "function") {
		params.dataBound();
	} else if (typeof params.dataBound == "string") {
		window[params.dataBound]();
	}
	$($(obj).closest("table")).css("width", "100%");
	$($(obj).closest("table")).dataTable(datatableConfig);

	return this;
}

/*
[dropDownList 공통]
- dataSource : JSON타입의 데이터 ( commonCode 또는 dataSource 둘 중 하나만 기입 )
- commonCode : 시스템구분코드 + '_' + 공통코드 (ex) 0000_SYSTEM_GCD
- dataTextField : dropdownlist option의 텍스트 값으로 사용 될 컬럼명 (생략가능)
- dataValueField : dropdownlist option의 value 값으로 사용 될 컬럼명 (생략가능)
- optionLabel : value값이 ""인 option의 텍스트 값 정의 (생략가능)
- defaultValue : 데이터바인딩 후 기본선택 될 값 (생략가능)
- expnCondition : 공통코드 중 제외할 코드 정의 (ex) "AND '1' = '1' AND 2 = 2" (생략가능)
- hakbuGradFg : 접속한 학생의 소속이 학부인지 대학원인지에 따라 공통코드의 '학부사용여부','대학원사용여부'에 해당하는 데이터만 가지고 올지 정의(생략가능) - 기본은 true
- dataBound : dropdownlist 적용 후 처리해야 할 작업을 정의 (생략가능)
- linkedTarget : linked Combo의 target이 되는 엘리먼트(select)
- linkedInfo.targetColumn : linked Combo의 target이 되는 엘리먼트(select)의 column
- linkedInfo.column : linked Combo의 target이 되는 엘리먼트(select)의 column과 매칭이 되는 column
*/


function getCode(options) {

	if (options.QPARAM) {
		getCodeByEtcParam(options);
	} else {

		var SYSTEM_GCD = (options.SYSTEM_GCD).replaceAll(' ', '');
		var CODE = (options.CODE).replaceAll(' ', '');
		var CODES = SYSTEM_GCD + "_" + CODE;
		var ALL_STR = gfn_str_parseNull(options.ALL_STR);

		if (CODE) {
			var data = {};
			data.CODES = CODES;
			data.ALL = options.ALL_STR;

			gfn_ajax_request({
				url: "/core/function/getCode",
				reqData: data,
				success: function(data, responseData) {
					options.dataBound(data[CODES]);
				}
			});
		}
	}
}

function getCodeByEtcParam(options) {
	var SYSTEM_GCD = (options.SYSTEM_GCD).replaceAll(' ', '');
	var CODE = (options.CODE).replaceAll(' ', '');
	var CODES = SYSTEM_GCD + "_" + CODE;
	var QPARAM = gfn_str_parseNull(options.QPARAM);
	var ALL_STR = gfn_str_parseNull(options.ALL_STR);
	if (CODE) {
		var data = {};
		data.CODE = CODES;
		data.QPARAM = QPARAM;
		data.ALL = ALL_STR;

		gfn_ajax_request({
			url: "/core/function/getCodeByEtcParam",
			reqData: data,
			success: function(data, responseData) {
				options.dataBound(data);
			}
		});
	}
}

$.fn.dropDownList = function(params) {
	var obj = $(this);
	$(obj).children().remove();
	if (params.optionLabel) {
		if (params.optionValue) {
			$(obj).append("<option value=" + params.optionValue + ">" + params.optionLabel + "</option>");
		} else {
			$(obj).append("<option value=''>" + params.optionLabel + "</option>");
		}
	}
	if (params.commonCode) {

		params.dataTextField = gfn_com_isEmptyObject(params.dataTextField) ? "COMMON_DETAIL_CD_KOR_NM" : params.dataTextField;
		params.dataValueField = gfn_com_isEmptyObject(params.dataValueField) ? "COMMON_DETAIL_CD" : params.dataValueField;

		params.hakbuGradFg = (params.hakbuGradFg == undefined) ? true : params.hakbuGradFg;

		var _etcCondition = "";
		if (gfn_str_parseNull(scwin.loginUser.collGradGcd) != "" && params.hakbuGradFg) {
			if (scwin.loginUser.collGradGcd == "0001") {
				_etcCondition = " AND HAKBU_USE_FG = 'Y'";
			} else if (scwin.loginUser.collGradGcd == "0002") {
				_etcCondition = " AND GRAD_USE_FG = 'Y'";
			}
		}

		gfn_ajax_request({
			url: "/core/function/getCodeByEtcParam"
			, reqData: {
				"CODE": params.commonCode,
				"QPARAM": gfn_com_parseNull(params.expnCondition) + _etcCondition
			}
			, success: function(data, responseData) {
				new Promise(function(resolve, reject) {
					$(obj).data(data);
					$.each(data, function(index, item) {
						$(obj).append($("<option value='" + item[params.dataValueField] + "'>" + item[params.dataTextField] + "</option>").data(item)).promise().done(function() {
							if ((data.length - 1) == index) {
								resolve(1);
							}
						});
					});
				}).then(function() {
					if (params.linkedTarget) {
						gfn_com_linkedDataBind(params, obj);
						$(params.linkedTarget).change(function() {
							gfn_com_linkedDataBind(params, obj);
						});
					} else {
						if (params.defaultValue) {
							$(obj).val(params.defaultValue);
							$(obj).trigger("change");
						}
					}
					if (typeof params.dataBound == "function") {
						params.dataBound();
					} else if (typeof params.dataBound == "string") {
						window[params.dataBound]();
					}
					if (typeof params.dataBounds == "function") {
						params.dataBounds();
					} else if (typeof params.dataBounds == "string") {
						window[params.dataBounds]();
					}
				});
			}
		});
	} else {
		new Promise(function(resolve, reject) {
			$(obj).data(params.dataSource);
			$.each(params.dataSource, function(index, item) {
				$(obj).append($("<option value='" + item[params.dataValueField] + "'>" + item[params.dataTextField] + "</option>").data(item));
				if ((params.dataSource.length - 1) == index) {
					resolve(1);
				}
			});
		}).then(function() {
			if (params.linkedTarget) {
				gfn_com_linkedDataBind(params, obj);
				$(params.linkedTarget).change(function() {
					gfn_com_linkedDataBind(params, obj);
				});
			} else {
				if (params.defaultValue) {
					$(obj).val(params.defaultValue);
					$(obj).trigger("change");
				}
			}
			if (typeof params.dataBound == "function") {
				params.dataBound();
			} else if (typeof params.dataBound == "string") {
				window[params.dataBound]();
			}
			if (typeof params.dataBounds == "function") {
				params.dataBounds();
			} else if (typeof params.dataBounds == "string") {
				window[params.dataBounds]();
			}
		});
	}
	return this;
}

function gfn_com_linkedDataBind(params, obj) {
	$(obj).html("");
	if (params.optionLabel) {
		if (params.optionValue) {
			$(obj).append("<option value=" + params.optionValue + ">" + params.optionLabel + "</option>");
		} else {
			$(obj).append("<option value=''>" + params.optionLabel + "</option>");
		}
	}
	if ($(params.linkedTarget).find("option:selected").val() != "") {
		$.each($(obj).data(), function(i, item) {
			_match = true;
			$.each(params.linkedInfo, function(_i, _item) {
				if (item[_item.column].indexOf($(params.linkedTarget).find("option:selected").data()[_item.targetColumn]) == -1) {
					_match = false;
					return false;
				}
			});
			if (_match) {
				$(obj).append($("<option value='" + item[params.dataValueField] + "'>" + item[params.dataTextField] + "</option>").data(item));
			}
		});
	}
	$(obj).trigger("change");
}

$.fn.extDropDownList = function(params) {
	var obj = $(this);
	var _obj;
	$(obj).addClass("d-none");
	$(obj).after('<span id="' + $(this).attr("id") + '_multi" style="width:100%"></span>');

	if (params.commonCode) {

		params.dataTextField = "label";
		params.dataValueField = "value";

		gfn_ajax_request({
			url: "/core/function/getCodeByEtcParam"
			, reqData: {
				"CODE": params.commonCode,
				"QPARAM": gfn_com_parseNull(params.expnCondition),
				"ALL": gfn_com_parseNull(params.optionLabel)
			}
			, async: false
			, success: function(data, responseData) {
				_obj = new SelectPure("#" + $(obj).attr("id") + '_multi', {
					options: data,
					multiple: params.multiple,
					autocomplete: params.autocomplete,
					icon: "fa fa-times",
					inlineIcon: false,
					onChange: function(val) {
						$(obj).val(gfn_str_replaceAll(val, " ", ""));
						$(obj).trigger("change");
					}
				});
				if (params.defaultValue) {
					$(obj).setValues(_obj, params.defaultValue);
				} else {
					$(obj).val("");
				}
				if (typeof params.dataBound == "function") {
					params.dataBound(_obj);
				} else if (typeof params.dataBound == "string") {
					window[params.dataBound](_obj);
				}
			}
		});
	} else {
		_obj = new SelectPure("#" + $(obj).attr("id") + '_multi', {
			options: params.dataSource,
			multiple: params.multiple,
			autocomplete: params.autocomplete,
			icon: "fa fa-times",
			inlineIcon: false,
			onChange: function(val) {
				$(obj).val(gfn_str_replaceAll(val, " ", ""));
				$(obj).trigger("change");
			}
		});
		if (params.defaultValue) {
			$(obj).setValues(_obj, params.defaultValue);
		} else {
			$(obj).val("");
		}
		if (typeof params.dataBound == "function") {
			params.dataBound();
		} else if (typeof params.dataBound == "string") {
			window[params.dataBound]();
		}
	}
	return _obj;
}

$.fn.setValue = function(val, callback) {
	if ($(this).next().find('.select-pure__option[data-value="' + val + '"]').length > 0) {
		var _obj = scwin[$(this).next().attr("id")];
		_obj.reset();
		if (gfn_str_parseNull(val) != "") {
			$.each(val.split(","), function(idx, item) {
				_obj._setValue(item);
			});
		}
		$(this).val(gfn_str_replaceAll(val, " ", ""));
		$(this).trigger("change");
		if (typeof callback == "function") {
			callback();
		} else if (typeof callback == "string") {
			window[callback]();
		}
	}
}
$.fn.setValues = function(_obj, val) {
	_obj.reset();
	$(this).val(gfn_str_replaceAll(val, " ", ""));
	if (gfn_str_parseNull(val) != "") {
		$.each(val.split(","), function(idx, item) {
			_obj._setValue(item);
		});
	}
}
$.fn.setReadOnly = function(_flag) {
	$(this).parent().find(".readonly").remove();
	if (_flag) {
		$(this).next().hide();
		$(this).before("<select class='form-control readonly'><option value='$(this).val()'>" + $(this).next().find('.select-pure__option[data-value="' + $(this).val() + '"]').text() + "</option></select>")
	} else {
		$(this).next().show();
	}
}

function gfn_com_assignCombo(options) {
	var initChk = (gfn_str_parseNull(options.initChk) != "") ? options.initChk : true;

	if (options != undefined) {
		if (options.comboLvl > 0) {
			$(options.collGradGcd).parent().find("span,div,input").unbind();
			$(options.collGradGcd).next().remove();
			$(options.collGradGcd).removeData();
			if (options.comboLvl > 1) {
				$(options.gradGcd).parent().find("span,div,input").unbind();
				$(options.gradGcd).next().remove();
				$(options.gradGcd).removeData();
				if (options.comboLvl > 2) {
					$(options.collCd).parent().find("span,div,input").unbind();
					$(options.collCd).next().remove();
					$(options.collCd).removeData();
					if (options.comboLvl > 3) {
						$(options.deptCd).parent().find("span,div,input").unbind();
						$(options.deptCd).next().remove();
						$(options.deptCd).removeData();
						if (options.comboLvl > 4) {
							$(options.majorCd).parent().find("span,div,input").unbind();
							$(options.majorCd).next().remove();
							$(options.majorCd).removeData();
						}
					}
				}
			}
		}
	}
	if (options != undefined) {
		if (options.comboLvl > 0) {
			scwin[$(options.collGradGcd).attr("id") + "_multi"] = $(options.collGradGcd).extDropDownList({
				commonCode: "0001_COLL_GRAD_GCD",
				multiple: false,
				autocomplete: true,
				optionLabel: "선택",
				defaultValue: " ",
				dataBound: function(e) {
					if (options.comboLvl > 1) {
						gfn_ajax_request({
							url: (gfn_str_parseNull(options.gradGcdExtUrl) != "" && gfn_str_parseNull(options.gradGcdExtUrl.url) != "") ? options.gradGcdExtUrl.url : "/core/function/getAssignComboGradGcdInfo"
							, reqData: (gfn_str_parseNull(options.gradGcdExtUrl) != "" && gfn_str_parseNull(options.gradGcdExtUrl.param) != "") ? options.gradGcdExtUrl.param : {}
							, success: function(data, responseData) {
								$(options.gradGcd).data(data);
								scwin[$(options.gradGcd).attr("id") + "_multi"] = $(options.gradGcd).extDropDownList({
									dataSource: data,
									multiple: false,
									autocomplete: true,
									optionLabel: "선택",
									defaultValue: " ",
									dataBound: function(e) {
										$.each($("#" + $(options.gradGcd).attr("id") + "_multi .select-pure__options .select-pure__option"), function(i, v) {
											if ($(this).attr("data-value") != " ") {
												$(this).attr("data-value", "_" + $(this).attr("data-value"))
											}
										});
										$("#" + $(options.gradGcd).attr("id") + "_multi .select-pure__options .select-pure__option").not($("#" + $(options.gradGcd).attr("id") + "_multi .select-pure__options .select-pure__option--selected")).hide();
										$(options.collGradGcd).change(function() {
											(scwin[$(options.gradGcd).attr("id") + "_multi"]).reset();
											(scwin[$(options.gradGcd).attr("id") + "_multi"])._setValue(" ");
											$(options.gradGcd).val("");
											$(options.gradGcd).trigger("change");
											$("#" + $(options.gradGcd).attr("id") + "_multi .select-pure__options .select-pure__option").not($("#" + $(options.gradGcd).attr("id") + "_multi .select-pure__options .select-pure__option--selected")).hide();
											$.each($(options.gradGcd).data(), function(idx, item) {
												if (item.COLL_GRAD_GCD == $(options.collGradGcd).val()) {
													$("#" + $(options.gradGcd).attr("id") + "_multi .select-pure__options .select-pure__option:eq(" + idx + ")").show();
													$("#" + $(options.gradGcd).attr("id") + "_multi .select-pure__options .select-pure__option:eq(" + idx + ")").attr("data-value", gfn_str_replaceAll($("#" + $(options.gradGcd).attr("id") + "_multi .select-pure__options .select-pure__option:eq(" + idx + ")").attr("data-value"), "_", ""));
												}
											});
											if ($(options.collGradGcd).val() == '0001') {
												(scwin[$(options.gradGcd).attr("id") + "_multi"])._setValue("0000");
												$(options.gradGcd).val("0000");
												$("#" + $(options.gradGcd).attr("id") + "_multi .select-pure__select").addClass("disabled");
												$("#" + $(options.gradGcd).attr("id") + "_multi .select-pure__options").addClass("hide");
											}else{
												$("#" + $(options.gradGcd).attr("id") + "_multi .select-pure__select").removeClass("disabled");
												$("#" + $(options.gradGcd).attr("id") + "_multi .select-pure__options").removeClass("hide");
											}
										});
										if (options.comboLvl > 2) {
											gfn_ajax_request({
												url: (gfn_str_parseNull(options.collCdExtUrl) != "" && gfn_str_parseNull(options.collCdExtUrl.url) != "") ? options.collCdExtUrl.url : "/core/function/getAssignComboCollCdInfo"
												, reqData: (gfn_str_parseNull(options.collCdExtUrl) != "" && gfn_str_parseNull(options.collCdExtUrl.param) != "") ? options.collCdExtUrl.param : {}
												, success: function(data, responseData) {
													$(options.collCd).data(data);
													(scwin[$(options.collCd).attr("id") + "_multi"]) = $(options.collCd).extDropDownList({
														dataSource: data,
														multiple: false,
														autocomplete: true,
														optionLabel: "선택",
														defaultValue: " ",
														dataBound: function(e) {
															$.each($("#" + $(options.collCd).attr("id") + "_multi .select-pure__options .select-pure__option"), function(i, v) {
																if ($(this).attr("data-value") != " ") {
																	$(this).attr("data-value", "_" + $(this).attr("data-value"))
																}
															});
															$("#" + $(options.collCd).attr("id") + "_multi .select-pure__options .select-pure__option").not($("#" + $(options.collCd).attr("id") + "_multi .select-pure__options .select-pure__option--selected")).hide();
															$(options.gradGcd).change(function() {
																(scwin[$(options.collCd).attr("id") + "_multi"]).reset();
																(scwin[$(options.collCd).attr("id") + "_multi"])._setValue(" ");
																$(options.collCd).val("");
																$(options.collCd).trigger("change");
																$("#" + $(options.collCd).attr("id") + "_multi .select-pure__options .select-pure__option").not($("#" + $(options.collCd).attr("id") + "_multi .select-pure__options .select-pure__option--selected")).hide();
																$.each($(options.collCd).data(), function(idx, item) {
																	if (item.COLL_GRAD_GCD == $(options.collGradGcd).val()) {
																		$("#" + $(options.collCd).attr("id") + "_multi .select-pure__options .select-pure__option:eq(" + idx + ")").show();
																		$("#" + $(options.collCd).attr("id") + "_multi .select-pure__options .select-pure__option:eq(" + idx + ")").attr("data-value", gfn_str_replaceAll($("#" + $(options.collCd).attr("id") + "_multi .select-pure__options .select-pure__option:eq(" + idx + ")").attr("data-value"), "_", ""));
																	}
																});
															});
															if (options.comboLvl > 3) {
																gfn_ajax_request({
																	url: (gfn_str_parseNull(options.deptCdExtUrl) != "" && gfn_str_parseNull(options.deptCdExtUrl.url) != "") ? options.deptCdExtUrl.url : "/core/function/getAssignComboDeptCdInfo"
																	, reqData: (gfn_str_parseNull(options.deptCdExtUrl) != "" && gfn_str_parseNull(options.deptCdExtUrl.param) != "") ? options.deptCdExtUrl.param : {}
																	, success: function(data, responseData) {
																		$(options.deptCd).data(data);
																		(scwin[$(options.deptCd).attr("id") + "_multi"]) = $(options.deptCd).extDropDownList({
																			dataSource: data,
																			multiple: false,
																			autocomplete: true,
																			optionLabel: "선택",
																			defaultValue: " ",
																			dataBound: function(e) {
																				$.each($("#" + $(options.deptCd).attr("id") + "_multi .select-pure__options .select-pure__option"), function(i, v) {
																					if ($(this).attr("data-value") != " ") {
																						$(this).attr("data-value", "_" + $(this).attr("data-value"))
																					}
																				});
																				$("#" + $(options.deptCd).attr("id") + "_multi .select-pure__options .select-pure__option").not($("#" + $(options.deptCd).attr("id") + "_multi .select-pure__options .select-pure__option--selected")).hide();
																				$(options.collCd).change(function() {
																					(scwin[$(options.deptCd).attr("id") + "_multi"]).reset();
																					(scwin[$(options.deptCd).attr("id") + "_multi"])._setValue(" ");
																					$(options.deptCd).val("");
																					$(options.deptCd).trigger("change");
																					$("#" + $(options.deptCd).attr("id") + "_multi .select-pure__options .select-pure__option").not($("#" + $(options.deptCd).attr("id") + "_multi .select-pure__options .select-pure__option--selected")).hide();
																					$.each($(options.deptCd).data(), function(idx, item) {
																						if (item.COLL_GRAD_GCD == $(options.collGradGcd).val()
																							&& item.COLL_CD == $(options.collCd).val()) {
																							$("#" + $(options.deptCd).attr("id") + "_multi .select-pure__options .select-pure__option:eq(" + idx + ")").show();
																							$("#" + $(options.deptCd).attr("id") + "_multi .select-pure__options .select-pure__option:eq(" + idx + ")").attr("data-value", gfn_str_replaceAll($("#" + $(options.deptCd).attr("id") + "_multi .select-pure__options .select-pure__option:eq(" + idx + ")").attr("data-value"), "_", ""));
																						}
																					});
																				});
																				if (options.comboLvl > 4) {
																					gfn_ajax_request({
																						url: (gfn_str_parseNull(options.majorCdExtUrl) != "" && gfn_str_parseNull(options.majorCdExtUrl.url) != "") ? options.majorCdExtUrl : "/core/function/getAssignComboMajorCdInfo"
																						, reqData: (gfn_str_parseNull(options.majorCdExtUrl) != "" && gfn_str_parseNull(options.majorCdExtUrl.param) != "") ? options.majorCdExtUrl.param : {}
																						, success: function(data, responseData) {
																							$(options.majorCd).data(data);
																							(scwin[$(options.majorCd).attr("id") + "_multi"]) = $(options.majorCd).extDropDownList({
																								dataSource: data,
																								multiple: false,
																								autocomplete: true,
																								optionLabel: "선택",
																								defaultValue: " ",
																								dataBound: function(e) {
																									$.each($("#" + $(options.majorCd).attr("id") + "_multi .select-pure__options .select-pure__option"), function(i, v) {
																										if ($(this).attr("data-value") != " ") {
																											$(this).attr("data-value", "_" + $(this).attr("data-value"))
																										}
																									});
																									$("#" + $(options.majorCd).attr("id") + "_multi .select-pure__options .select-pure__option").not($("#" + $(options.majorCd).attr("id") + "_multi .select-pure__options .select-pure__option--selected")).hide();
																									$(options.deptCd).change(function() {
																										(scwin[$(options.majorCd).attr("id") + "_multi"]).reset();
																										(scwin[$(options.majorCd).attr("id") + "_multi"])._setValue(" ");
																										$(options.majorCd).val("");
																										$(options.majorCd).trigger("change");
																										$("#" + $(options.majorCd).attr("id") + "_multi .select-pure__options .select-pure__option").not($("#" + $(options.majorCd).attr("id") + "_multi .select-pure__options .select-pure__option--selected")).hide();
																										$.each($(options.majorCd).data(), function(idx, item) {
																											if (item.COLL_GRAD_GCD == $(options.collGradGcd).val()
																												&& item.GRAD_GCD == $(options.gradGcd).val()
																												&& item.COLL_CD == $(options.collCd).val()
																												&& item.DEPT_CD == $(options.deptCd).val()) {
																												$("#" + $(options.majorCd).attr("id") + "_multi .select-pure__options .select-pure__option:eq(" + idx + ")").show();
																												$("#" + $(options.majorCd).attr("id") + "_multi .select-pure__options .select-pure__option:eq(" + idx + ")").attr("data-value", gfn_str_replaceAll($("#" + $(options.majorCd).attr("id") + "_multi .select-pure__options .select-pure__option:eq(" + idx + ")").attr("data-value"), "_", ""));
																											}
																										});
																									});
																									gfn_com_assignCombo_dataBound(options.dataBound, initChk, options);
																								}
																							});
																						}
																					});
																				} else {
																					gfn_com_assignCombo_dataBound(options.dataBound, initChk, options);
																				}
																			}
																		});
																	}
																});
															} else {
																gfn_com_assignCombo_dataBound(options.dataBound, initChk, options);
															}
														}
													});
												}
											});
										} else {
											gfn_com_assignCombo_dataBound(options.dataBound, initChk, options);
										}
									}
								});
							}
						});
					} else {
						gfn_com_assignCombo_dataBound(options.dataBound, initChk, options);
					}
				}
			});
		} else {
			gfn_com_assignCombo_dataBound(options.dataBound, false, 0);
		}
	}
}

function gfn_com_assignCombo_dataBound(callback, _flag, options) {
	setTimeout(function() {
		if (_flag && gfn_str_parseNullZero(options.comboLvl) > 0) {
			$(options.collGradGcd).setValue(gfn_str_parseNullDefault(scwin.loginUser.collGradGcd, " "), function() {
				if (options.comboLvl > 1) {
					$(options.gradGcd).setValue(gfn_str_parseNullDefault(scwin.loginUser.gradGcd, " "), function() {
						if (options.comboLvl > 2) {
							$(options.collCd).setValue(gfn_str_parseNullDefault(scwin.loginUser.collCd, " "), function() {
								if (options.comboLvl > 3) {
									$(options.deptCd).setValue(gfn_str_parseNullDefault(scwin.loginUser.deptCd, " "), function() {
										if (options.comboLvl > 4) {
											$(options.majorCd).setValue(gfn_str_parseNullDefault(scwin.loginUser.majorCd, " "));
										}
									});
								}
							});
						}
					});
				}
			});
		}
		$(".select-pure__select").bind('click', function() { $(".select-pure__select").not($(this)).removeClass('select-pure__select--opened'); });
		if (typeof callback == "function") {
			callback();
		} else if (typeof callback == "string") {
			window[callback]();
		}
	}, 300);
}

function gfn_com_DropDownLists(map, callBack) {
	$.each(map, function(index, item) {
		if ((map.length - 1) == index && callBack != undefined) {
			item.dataBounds = callBack;
		}
		$(item.elements).dropDownList(item);
	});
}


$.fn.RadioList = function(params) {
	var obj = $(this);
	var objId = gfn_str_replaceAll($(obj).attr("id"), "Wrap", "");
	if (params.CODE) {
		getCode({
			SYSTEM_GCD: params.SYSTEM_GCD,
			CODE: params.CODE,
			QPARAM: params.QPARAM,
			ALL_STR: params.ALL_STR,
			dataBound: function(dataList) {
				$.each(dataList, function(index, item) {
					var list_html = "";
					list_html += '<div class="custom-control custom-radio custom-control-inline">';
					list_html += '	<input type="radio" ' + (params.chrt1 ? "chrt1='" + item["chrt1"] + "'" : "") + ' id="' + objId + index + '" name="' + objId + '" value="' + item[params.dataValueField] + '" data-bind="checked:' + objId + '" ' + ((params.defaultValue == item[params.dataValueField]) ? "checked" : "") + ' class="custom-control-input">';
					list_html += '	<label class="custom-control-label" for="' + objId + index + '">' + item[params.dataTextField] + '</label>';
					list_html += '</div>';
					obj.append(list_html);
				});
				if (typeof params.dataBound == "function") {
					params.dataBound();
				} else if (typeof params.dataBound == "string") {
					window[params.dataBound]();
				}
			}
		});
	} else {
		$.each(params.dataSource, function(index, item) {
			var list_html = "";
			list_html += '<div class="custom-control custom-radio custom-control-inline">';
			list_html += '	<input type="radio" ' + (params.chrt1 ? "chrt1='" + item["chrt1"] + "'" : "") + ' id="' + objId + index + '" name="' + objId + '" value="' + item[params.dataValueField] + '" data-bind="checked:' + objId + '" ' + ((params.defaultValue == item[params.dataValueField]) ? "checked" : "") + ' class="custom-control-input">';
			list_html += '	<label class="custom-control-label" for="' + objId + index + '">' + item[params.dataTextField] + '</label>';
			list_html += '</div>';
			obj.append(list_html);
		});
		if (typeof params.dataBound == "function") {
			params.dataBound();
		} else if (typeof params.dataBound == "string") {
			window[params.dataBound]();
		}
	}
}

$.fn.checkBoxList = function(params) {

	var obj = $(this);
	var objId = gfn_str_replaceAll($(obj).attr("id"), "Wrap", "");
	if (params.CODE) {
		getCode({
			SYSTEM_GCD: params.SYSTEM_GCD,
			CODE: params.CODE,
			QPARAM: params.QPARAM,
			ALL_STR: params.ALL_STR,
			dataBound: function(dataList) {
				$.each(dataList, function(index, item) {
					var list_html = "";
					list_html += "<div class='custom-control custom-checkbox custom-control-inline'>";
					list_html += "		<input type='checkbox'" + (params.chrt1 ? "chrt1='" + item["chrt1"] + "'" : "") + " id='" + objId + index + "' name='" + objId + "' value='" + item[params.dataValueField] + "' data-bind='checked: " + objId + "' " + ((params.defaultValue == item[params.dataValueField]) ? "checked" : "") + " class='custom-control-input'> ";
					list_html += "		<label class='custom-control-label' for='" + objId + index + "'>" + item[params.dataTextField] + "</label>";
					list_html += "</div>";
					obj.append(list_html);
				});
				if (typeof params.dataBound == "function") {
					params.dataBound();
				} else if (typeof params.dataBound == "string") {
					window[params.dataBound]();
				}
			}
		});
	} else {
		$.each(params.dataSource, function(index, item) {
			var list_html = "";
			list_html += "<div class='custom-control custom-checkbox custom-control-inline'>";
			list_html += "		<input type='checkbox'" + (params.chrt1 ? "chrt1='" + item["chrt1"] + "'" : "") + " id='" + objId + index + "' name='" + objId + "' value='" + item[params.dataValueField] + "' data-bind='checked: " + objId + "' " + ((params.defaultValue == item[params.dataValueField]) ? "checked" : "") + " class='custom-control-input'> ";
			list_html += "		<label class='custom-control-label' for='" + objId + index + "'>" + item[params.dataTextField] + "</label>";
			list_html += "</div>";
			obj.append(list_html);
		});
		if (typeof params.dataBound == "function") {
			params.dataBound();
		} else if (typeof params.dataBound == "string") {
			window[params.dataBound]();
		}
	}


}

function gfn_com_loadJavascript(url, callback, charset, afterSelector) {
	var head = document.getElementsByTagName('head')[0];
	var script = document.createElement('script');
	script.type = 'text/javascript';
	if (charset != null) {
		script.charset = "UTF-8";
	}

	var loaded = false;
	script.onreadystatechange = function() {
		if (this.readyState == 'loaded' || this.readyState == 'complete') {
			if (loaded) {
				return;
			}
			loaded = true;
			if (typeof callback == "function") {
				callback();
			}
		}
	}
	script.onload = function() {
		if (typeof callback == "function") {
			callback();
		}
	}

	script.src = url;

	head.prepend(script);
}


function gfn_com_loadJavascriptArr(arr, callback, charset) {
	var idx = 0;
	function gfn_com_loadJavascriptArrCallBack() {
		idx += 1;
		if (idx == arr.length) {
			if (typeof callback == "function") {
				callback();
			}
		} else {
			gfn_com_loadJavascript(arr[idx], gfn_com_loadJavascriptArrCallBack);
		}
	}
	gfn_com_loadJavascript(arr[idx], gfn_com_loadJavascriptArrCallBack);
}

/**
 * 기능 : object의 Empty 여부를 체크한다.(들어 있는 값이 ''일 경우 Empty로 간주)
 * @param obj : (Object) 체크하고자 하는 object
 * @returns {Boolean} : true - Empty
 */
function gfn_com_isEmptyObject(obj) {
	if (obj == null) return true;
	if (typeof obj == "undefined") return true;
	if (typeof obj == "string") {
		if (obj == "") return true;
	}
	if (obj == "string") {
		if (obj == "") return true;
	}
	if (typeof obj == "function") {
		return false;
	}
	if (obj == window) return false;
	if (typeof obj == "object") {
		if (Object.keys(obj).length <= 0) return true;
	}
	if (typeof obj == "number") return false;
	for (var objKey in obj) {
		if (typeof obj[objKey] != "undefined" && obj[objKey] != null && obj[objKey] != "") return false;
	}
	if (jQuery.isEmptyObject(obj)) return true;

	return true;
}

function gfn_com_parseNull(object) {
	sResult = "";
	if (object !== null) {
		try {
			sResult = object + "";
		} catch (e) {
			sResult = "";
		}
	} else {
		sResult = "";
	}
	if (sResult === "null" || sResult === "undefined") {
		sResult = "";
	}
	return sResult;
}

/**
 * form tag 내의 데이터를 json 형태로 변환
 * @param formID (String) 변환하고자 하는 form의 ID
 * @returns (JSON) 변환된 데이터...
 */
function gfn_com_formToJson(formID) {
	var data = {};
	var form = $("#" + formID);
	var arr = form.serializeArray();
	$.each(arr, function(idx, ele) {
		data[ele.name] = ele.value;
	});

	return data;
}

/**
 * form tag 내의 데이터를 get 파라메터 형태로 변환
 * @param formID (String) 변환하고자 하는 form의 ID
 * @returns (String) 변환된 String
 */
function gfn_com_formToGetParam(formID) {
	var data = "";
	var form = $("#" + formID);
	var data = form.serialize();
	return data;
}

/**
 * tr tag 내의 데이터를 json 형태로 변환
 * @param trID (String) 변환하고자 하는 tr의 ID
 * @returns (JSON) 변환된 데이터...
 */
function gfn_com_trToJson(trID) {
	var data = {};
	var tr = $("#" + trID);
	var arrComp = tr.children("td");

	for (var i = 0; i < arrComp.length; i++) {
		var comp = arrComp.name;
		if (comp.getAttribute("name")) {
			data[comp.getAttribute("name")] = comp.getAttribute("value")
		}
	}

	return data;
}

/**
 * tr tag 내의 데이터를 파라메터 형태로 변환
 * @param trID (String) 변환하고자 하는 tr의 ID
 * @returns (String) 변환된 파라메터...
 */
function gfn_com_trToGetParam(trID) {
	var data = "";
	var tr = $("#" + trID);
	var arrComp = tr.children("td");

	for (var i = 0; i < arrComp.length; i++) {
		var comp = arrComp[i];
		if (comp.getAttribute("name")) {
			if (data != "") {
				data += "&" + comp.getAttribute("name") + "=" + comp.getAttribute("value");
			} else {
				data += comp.getAttribute("name") + "=" + comp.getAttribute("value");
			}
		}
	}
	return data;
}

//쿠키값 조회
function gfn_com_getCookie(c_name) {
	var i, x, y, cookies = document.cookie.split(";");
	for (i = 0; i < cookies.length; i++) {
		x = cookies[i].substr(0, cookies[i].indexOf("="));
		y = cookies[i].substr(cookies[i].indexOf("=") + 1);
		x = x.replace(/^\s+|\s+$/g, "");

		if (x == c_name) {
			return unescape(y);
		}
	}
}

//쿠키값 설정
function gfn_com_setCookie(c_name, value, exdays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var c_value = escape(value) + ((exdays == null) ? "; path=/;" : "; path=/; expires=" + exdate.toUTCString());
	document.cookie = c_name + "=" + c_value;
}

//쿠키값 삭제
function gfn_com_delCookie(c_name) {
	gfn_com_setCookie(c_name, "", -1);
}

function gfn_com_excelDownloadFile(colName, data, excelName) {
	var xlsObj = [];

	$.each(data, function(i, v) {
		var _data = {};
		$.each(colName, function(idx, item) {
			_data[item.name] = v[item.key]
		});
		xlsObj.push(_data);
	});

	// step 1. workbook 생성
	var wb = XLSX.utils.book_new();
	// step 2. 시트 만들기 
	var newWorksheet = XLSX.utils.json_to_sheet(xlsObj);
	// step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
	XLSX.utils.book_append_sheet(wb, newWorksheet, 'Sheet1');
	// step 4. 엑셀 파일 만들기 
	var wbout = XLSX.write(wb, { bookType: 'xlsx', type: 'binary' });
	// step 5. 엑셀 파일 내보내기 
	saveAs(new Blob([s2ab(wbout)], { type: "application/octet-stream" }), excelName + '.xlsx');
}


function gfn_com_getUrlParam(findKey) {
	var search = gfn_str_parseNull(location.search);
	var rtnVal = "";

	if (search == "") return "";

	search = gfn_str_parseNull(search.substr(1));

	if (search == "") return "";

	var arrParam = search.split("&");

	if (arrParam.length <= 0) return "";

	$.each(arrParam, function(idx, strParam) {
		strParam = gfn_str_parseNull(strParam);
		if (strParam == "") return true;
		var splVal = strParam.split("=");
		if (splVal.length <= 1) return true;

		var key = gfn_str_parseNull(splVal[0]);
		var val = gfn_str_parseNull(splVal[1]);

		if (key == findKey) {
			rtnVal = val;
			return false;
		}
	});
	return rtnVal;
}

function gfn_com_getUrlParamToObj(url) {
	url = gfn_str_parseNull(url);
	var rtnObj = {};
	var arrUrl = url.split("?");

	if (arrUrl.length <= 1) return rtnObj;

	var paramStr = gfn_str_parseNull(arrUrl[1]);
	if (paramStr == "") return rtnObj;

	var arrParam = paramStr.split("&");
	$.each(arrParam, function(i, strParam) {
		strParam = gfn_str_parseNull(strParam);
		var splParam = strParam.split("=");
		if (splParam.length > 1) {
			rtnObj[splParam[0]] = splParam[1];
		}
	});

	return rtnObj;
}

function gfn_com_getObjToUrlParam(obj) {
	var rtnStr = "";
	if (gfn_com_isEmptyObject(obj)) return rtnStr;
	$.each(obj, function(key, val) {
		rtnStr += rtnStr == "" ? (key + "=" + val) : ("&" + (key + "=" + val));
	});
	return rtnStr;
}

function gfn_com_bindChangeChkStEnDate(startCompId, endCompId) {
	var startComp = $("#" + startCompId);
	var endComp = $("#" + endCompId);

	if (startComp.length <= 0 || endComp.length <= 0) {
		return;
	}

	startComp.bind("change", function() {
		var sDate = gfn_str_parseNull(startComp.val()).replace(/[^0-9]/gi, "");
		var eDate = gfn_str_parseNull(endComp.val()).replace(/[^0-9]/gi, "");

		if (sDate != "" && eDate != "") {
			if (sDate > eDate) {
				alert("시작일자가 종료일자보다 클 수 없습니다.");
				$(this).val("");
				return;
			}
		}
	});

	endComp.bind("change", function() {
		var sDate = gfn_str_parseNull(startComp.val()).replace(/[^0-9]/gi, "");
		var eDate = gfn_str_parseNull(endComp.val()).replace(/[^0-9]/gi, "");

		if (sDate != "" && eDate != "") {
			if (sDate > eDate) {
				alert("시작일자가 종료일자보다 클 수 없습니다.");
				$(this).val("");
				return;
			}
		}
	});
}

function gfn_com_setObjToForm(formId, paramObj) {
	var formComp = $("#" + formId);
	$.each(paramObj, function(key, val) {
		var input = formComp.find("[name='" + key + "']");
		if (input.length <= 0) {
			formComp.append("<input type='hidden' name='" + key + "' value='" + val + "'/>");
			input = formComp.find("[name='" + key + "']");
		}
		input.val(val);
	});
}

/**
 * 입력 시 넘버 키만 가능하도록 설정
 * @param evt (Event) event 객체
 * @param copyAllow (Boolean) 복사 붙여넣기 허용여부 default true
 */
function gfn_com_isNumberKey(evt, copyAllow) {
	if (gfn_str_parseNull(copyAllow) == "") copyAllow = true;
	var rtnValue = false;

	evt = evt || window.event;
	var charCode = (evt.which) ? evt.which : event.keyCode;
	if ((charCode <= 31) || (charCode >= 48 && charCode <= 57) || (charCode >= 96 && charCode <= 105)) rtnValue = true;

	if (copyAllow == true) {
		//ctrl + v 허용
		if (scwin.isKeyDownCtrl && charCode == 86) rtnValue = true;
		//ctrl + c 허용
		if (scwin.isKeyDownCtrl && charCode == 67) rtnValue = true;
	}

	return rtnValue;
}

function gfn_com_isNumber(s) {
	s += '';
	s = s.replace(/^\s*|\s*$/g, '');
	if (s == '' || isNaN(s)) return false;
	return true;
}

function gfn_com_cashReturn(num) {
	var numValue = "" + num;

	var rxSplit = new RegExp('([0-9])([0-9][0-9][0-9][,.])');
	var arrNumber = numValue.split('.');
	arrNumber[0] += '.';
	do {
		arrNumber[0] = arrNumber[0].replace(rxSplit, '$1,$2');
	}
	while (rxSplit.test(arrNumber[0]));

	var com = "";
	if (arrNumber.length > 1) {
		com = arrNumber.join('');
	} else {
		com = arrNumber[0].split('.')[0];
	}
	return com;
}

function gfn_com_dataBind(obj, data, obj_, callBack) {
	$.each($(obj).find("[data-bind]").not(obj_), function(i, v) {
		for (var idx = 0; idx < (($(v).attr("data-bind")).split(",")).length; idx++) {
			var obj_ = (($(v).attr("data-bind")).split(",")[idx]).replace(/ /g, '');
			if ((obj_.split(":")).length == 2) {
				if (data != null && (((obj_.split(":")[0] == "unit" || obj_.split(":")[0] == "cash&unit") && data.hasOwnProperty((obj_.split(":")[1]).split("|")[0])) || (obj_.split(":")[0] != "unit" && obj_.split(":")[0] != "cash&unit" && data.hasOwnProperty(obj_.split(":")[1])))) {
					if (obj_.split(":")[0] == "value") {
						$(v).val(gfn_com_valencode(gfn_str_parseNull(data[obj_.split(":")[1]])));
					} else if (obj_.split(":")[0] == "text") {
						$(v).text(gfn_com_valencode(gfn_str_parseNull(data[obj_.split(":")[1]])));
					} else if (obj_.split(":")[0] == "html") {
						$(v).html(gfn_com_htmlencode(gfn_str_parseNull(data[obj_.split(":")[1]])));
					} else if (obj_.split(":")[0] == "htmlBr") {
						$(v).html(gfn_com_htmlbr(gfn_com_htmlencode(gfn_str_parseNull(data[obj_.split(":")[1]]))));
					} else if (obj_.split(":")[0] == "checked") {
						if ($(v).val() == data[obj_.split(":")[1]]) {
							$(v).prop("checked", true);
						}
					} else if (obj_.split(":")[0] == "chkContains") {
						if (gfn_str_parseNull((data[obj_.split(":")[1]])).indexOf($(v).val()) != -1) {
							$(v).prop("checked", true);
						}
					} else if (obj_.split(":")[0] == "selected") {
						if (data[obj_.split(":")[1]] != null && data[obj_.split(":")[1]] != "") {
							$(v).val(data[obj_.split(":")[1]]).prop("selected", true);
						} else {
							$(v).find("option:eq(0)").prop("selected", true);
						}
					} else if (obj_.split(":")[0] == "unit") {
						$(v).text(gfn_str_parseNullUnit(data[(obj_.split(":")[1]).split("|")[0]], (obj_.split(":")[1]).split("|")[1]));
					} else if (obj_.split(":")[0] == "cash") {
						$(v).text(gfn_com_cashReturn(gfn_str_parseNull(data[obj_.split(":")[1]])));
					} else if (obj_.split(":")[0] == "cash&unit") {
						$(v).text(gfn_str_parseNullUnit(gfn_com_cashReturn(gfn_str_parseNull(data[(obj_.split(":")[1]).split("|")[0]])), (obj_.split(":")[1]).split("|")[1]));
					} else if (obj_.split(":")[0] == "v_cash") {
						$(v).val(gfn_com_cashReturn(gfn_str_parseNullZero(data[obj_.split(":")[1]])));
					}
				} else {
					if (obj_.split(":")[0] == "value") {
						$(v).val("");
					} else if (obj_.split(":")[0] == "text") {
						$(v).text("");
					} else if (obj_.split(":")[0] == "html") {
						$(v).html("");
					} else if (obj_.split(":")[0] == "checked") {
						$(v).prop("checked", false);
					} else if (obj_.split(":")[0] == "chkContains") {
						$(v).prop("checked", false);
					} else if (obj_.split(":")[0] == "selected") {
						$(v).find("option:eq(0)").prop("selected", true);
					} else if (obj_.split(":")[0] == "unit") {
						$(v).text("");
					} else if (obj_.split(":")[0] == "cash") {
						$(v).text("");
					} else if (obj_.split(":")[0] == "cash&unit") {
						$(v).text("");
					} else if (obj_.split(":")[0] == "v_cash") {
						$(v).val("0");
					}
				}
			} else {
				console.log('data-bind설정값을 확인 하세요 - (' + obj_ + ')');
			}
		}
	});
	if (typeof callBack == "function") {
		callBack();
	} else if (typeof callBack == "string") {
		window[callBack]();
	}
	return true;
}

function gfn_com_htmlencode(html) {
	return gfn_str_IgnoreReplaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(html), '&lt;', '<'), '&gt;', '>'), '&quot;', '\"'), '&amp;', '&'), '&quot;', ''), '&#39;', '\''), '<script>', '&lt;script&gt;'), '</script>', '&lt;/script&gt;'), 'javascript', 'security'), 'onerror', 'security'), 'oncopy', 'security'), 'alert', 'security'), 'confirm', 'security'), 'iframe', 'security'), 'document', 'security'), 'onmouseover', 'security'), 'cookie', 'security'), /details/gi, 'security');
}

function gfn_com_valencode(val) {
	return gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(gfn_str_replaceAll(val, '&lt;', '<'), '&gt;', '>'), '&quot;', '\"'), '&amp;', '&'), '&apos;', "\'");
}

function gfn_com_htmlbr(html) {
	return html.replace(/(\n|\r\n)/g, '<br/>');
}

function gfn_com_htmlContent(html) {
	if (scwin.clause._options.params != undefined) {
		$.map(scwin.clause._options.params, function(v, k) {
			html = gfn_str_replaceAll(html, "${" + k + "}", v);
		});
	}
	return html.replace(/(\n|\r\n)/g, '<br/>');
}

function gfn_com_inputdata(obj) {
	var param = new Object();
	$(obj).find("input, select, textarea").each(function(i) {
		if ($(this).attr("type") == "radio") {
			if ($(this).is(":checked")) {
				param[$(this).attr('name')] = $(this).val();
			}
		} else if ($(this).attr("type") == "checkbox") {
			if ($(this).is(":checked")) {
				param[$(this).attr('id')] = $(this).val();
			}
		} else {
			param[$(this).attr('id')] = $(this).val();
		}
	});
	return param;
}

function gfn_com_searchData(obj) {
	var param = gfn_com_inputdata(obj);
	$.each(scwin.pageInfo, function(k, v) {
		param[k] = v;
	});
	return param;
}

function gfn_com_pagingdata(param) {
	param["pageSize"] = scwin.pageInfo.pageSize;
	param["pageIndex"] = $(".pagination .active > a").attr("pageIndex");
	return param;
}

function gfn_com_pagingBind(param) {
	scwin.pageInfo.pageSize = param.pageSize;
	scwin.pageInfo.pageIndex = param.pageIndex;
}

/**
 * @param id (String) 바인딩항 ID
 * @param option (Object) {charType :"", charTitle : "", subtitle : "", xAxis : [], yAxis : "",tooltipFrmtType : "cnt", data :[]}
 */
function gfn_com_charDataBind(id, option) {
	var arrColors = ["#ffc600" //연한노랑 
		, "#ff8500" //주황
		, "#142e6b" // 네이비
		, "#a2beff" // 연한 파랑
		, "#6090ff" // 보라끼도는 쨍한파랑 
		, "#2d55b5" //그냥좀진한파랑 
		, "#005761" //진한 청록 
		, "#75d3df" //아주밝은 청록 
		, "#65a9b2" //약간어두운청록
		, "#028798" //중간청록
	];
	Highcharts.setOptions({
		lang: {
			thousandsSep: ','
		},
		colors: arrColors
	});
	var charType = gfn_str_parseNull(option.charType) ? gfn_str_parseNull(option.charType) : 'column';

	var chart = {

		type: charType
	};
	var title = {
		text: gfn_str_parseNull(option.charTitle)
	};
	var subtitle = {
		text: gfn_str_parseNull(option.subtitle)
	};
	var xAxis = {
		categories: option.xAxis, //  ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
		crosshair: true
	};
	var yAxis = {
		min: 0,
		title: {
			text: gfn_str_parseNull(option.yAxis)
		}
	};
	var formatPerYn = option.tooltipFrmtType == "cnt" ? false : true;
	var tooltipformat = '';
	if (formatPerYn) {
		tooltipformat = '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			'<td style="padding:0"><b>{point.y:,.0f}</b></td></tr>';
	} else {
		tooltipformat = "<b>{series.key}</b>: <b>{point.y:,.0f}건({point.percentage:.1f}%)</b>";
	}

	var tooltip = {
		headerFormat: '<b>{point.key}<b>',
		pointFormat: tooltipformat,
		footerFormat: '',
		shared: false,
		useHTML: true,
		valueSuffix: '건'
	};
	var plotOptions = {
		column: {
			pointPadding: 0.2,
			borderWidth: 0
		},
		pie: {
			allowPointSelect: true,
			cursor: 'pointer',
			dataLabels: {
				enabled: false,
				format: '<b>{point.name}</b>: <br>{point.y:,.0f}건<br>{point.percentage:.1f}%',
				style: {
					color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
				}
			},
			showInLegend: true
		}
	};
	var legend = {
		enabled: true,
		layout: 'vertical',
		align: 'right',
		width: 200,
		verticalAlign: 'middle',
		useHTML: true,
		labelFormatter: function() {
			var cnt = gfn_str_parseNull(this.y).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			var str = '<div class="form-group" style="width: 200px;">'
				+ '<div class="col-xs-5 text-left">' + this.name
				+ '</div>'
				+ '<div class="col-xs-6 text-right">' + cnt + "건"
				+ '</div>'
				+ '</div><div class="gapLine"></div>';
			return str;
		}
	}
	var credits = {
		enabled: false
	};
	if (charType == "pie") {
		$.each(option.data, function(idx) {
			option.data[idx]["size"] = '100%';
			option.data[idx]["innerSize"] = '60%';
		});
	}


	var series = option.data;
	var highcharts = {};
	highcharts.chart = chart;
	highcharts.title = title;
	highcharts.subtitle = subtitle;
	highcharts.tooltip = tooltip;
	highcharts.xAxis = xAxis;
	highcharts.yAxis = yAxis;
	highcharts.series = series;
	highcharts.plotOptions = plotOptions;
	if (charType == "pie") {
		highcharts.legend = legend;
	}
	highcharts.credits = credits;

	$('#' + id).highcharts(highcharts);

}

function gfn_com_isValidFileSize(fileObj, limit, sizeUnit) {
	var iSize = 0;

	if ($.browser.msie) {
		var objFSO = new ActiveXObject("Scripting.FileSystemObject");
		var sPath = $(fileObj)[0].value;
		var objFile = objFSO.getFile(sPath);
		var iSize = objFile.size;
		iSize = iSize / 1024;
	} else {
		iSize = $(fileObj)[0].files[0].size;
	}

	var flag = false;
	var limitSize = limit;
	if (sizeUnit == 'MB') {
		limitSize = limit * 1024;
	}
	if (iSize != undefined) {
		if ((iSize / 1024) > limitSize) {
			flag = true;
		}
	}
	if (flag) {
		if (sizeUnit == 'MB') {
			iSize = ((iSize / 1024) / 1024).toFixed(1);
		} else {
			iSize = (iSize / 1024).toFixed(1);
		}
		alert("제한용량 " + limit + sizeUnit + "를 초과 하였습니다. [ 첨부파일용량 : " + iSize + sizeUnit + " ]");
		$(fileObj).val("");
		return false;
	}
	return true;
}

var extList = ['png', 'xlsx', 'jpg'];

function gfn_com_isValidExt(fileObj, extList) {

	var fileName = $(fileObj).val();
	var index = fileName.lastIndexOf('.');
	var extName = fileName.substring(index + 1, fileName.len);

	var isValidExt = false;
	for (var i in extList) {
		if (extList[i] == extName || extList[i].toUpperCase() == extName) {
			isValidExt = true;
		}
	}
	if (!isValidExt) {
		alert("첨부파일은 " + extList.join(', ') + " 확장자만 등록 가능 합니다.");
		$(fileObj).val("");
		return false;
	}
	return true;
}

var extFilteringList = ['exe', 'msi', 'cab'];

function gfn_com_isValidExtFilter(fileObj, extFilteringList) {

	var fileName = $(fileObj).val();
	var index = fileName.lastIndexOf('.');
	var extName = fileName.substring(index + 1, fileName.len);

	var isValidFilteringExt = false;
	var filterExt = "";
	for (var i in extFilteringList) {
		if (extFilteringList[i] == extName || extFilteringList[i].toUpperCase() == extName) {
			isValidFilteringExt = true;
			filterExt = extFilteringList[i];
			break;
		}
	}
	if (isValidFilteringExt) {
		alert(filterExt + " 확장자는 등록이 불가능 합니다.");
		$(fileObj).val("");
		return false;
	}
	return true;
}

function gfn_com_returnExtension(fileNm) {
	var len = fileNm.length;
	var last = fileNm.lastIndexOf(".");
	if (last == -1) {
		return "";
	}
	var ext = fileNm.substring(last, len);
	ext = ext.toLowerCase();
	return ext;
}

function gfn_com_hidingModalWall(e, callback) {
	$('#' + $("#" + e.target.id).attr("popupdiv")).animate({ opacity: 0 }, { queue: false, duration: 'slow' });
	$('#' + $("#" + e.target.id).attr("popupdiv")).animate({ top: (parseInt(gfn_str_replaceAll($('#' + $("#" + e.target.id).attr("popupdiv")).css("top"), 'px', '')) - 30) }, 'slow');

	$('#' + $("#" + e.target.id).attr("popupdiv")).hide('fast', function() {
		$('#' + $("#" + e.target.id).attr("popupdiv")).html("");
		$("#" + e.target.id).attr("class", "modal-wall-none");
		$("html,body").css("overflow-y", "auto");
		if (typeof callback == "function") {
			callback();
		}
		$(this).trigger('hide');
		$('#' + $("#" + e.target.id).attr("popupdiv")).remove();
		$("#" + e.target.id).remove();
	});
	return false;
}

function gfn_com_closeModalWall(index, callback) {
	var suffixStr = "";
	if (index == undefined) {
		index = 1;
	}
	if (typeof index == "object") {
		index = $(index).closest($(".popup")).attr("idx");
	}

	for (var idx = 1; idx < index; idx++) {
		suffixStr += "_";
	}

	$('#popupWrap' + suffixStr).animate({ opacity: 0 }, { queue: false, duration: 'slow' });
	$('#popupWrap' + suffixStr).animate({ top: (parseInt(gfn_str_replaceAll($('#popupWrap' + suffixStr).css("top"), 'px', '')) - 30) }, 'slow');

	$('#popupWrap' + suffixStr).hide('fast', function() {
		$('#popupWrap' + suffixStr).html("");
		if ($('#popupWrap' + suffixStr).attr("class").indexOf("noticePopup") > -1) {
			if ($(".popup-wrap ").length == 1) {
				$("#modalWall").attr("class", "modal-wall-none");
			}
		} else {
			$("#modalWall" + suffixStr).attr("class", "modal-wall-none");
		}
			
		
		$("html,body").css("overflow-y", "auto");
		if (typeof callback == "function") {
			callback();
		}
		$(this).trigger('hide');

		if ($('#popupWrap' + suffixStr).attr("class").indexOf("noticePopup") > -1) {
			if ($(".popup-wrap ").length == 1) {
				$("#modalWall" ).remove();
			}
		} else {
			$("#modalWall" + suffixStr).remove();
		}
		$('#popupWrap' + suffixStr).remove();
	});
	return false;
}

function gfn_com_maxZindex(startIdx) {
	var num = 1;
	$("div").not(".ui-datepicker").each(function() {
		var z = $(this).css("z-index");
		if (z != "auto" && parseInt(z) >= num) {
			num = parseInt(z) + 1;
		}
	});
	return parseInt(num) + parseInt(startIdx);
}

/*
[modal팝업 공통]
- width : 팝업 가로길이 (미 입력시 기본값 500)
- height : 팝업 세로길이 (미 입력시 기본값 500)
- index : 팝업이 여러 개 인 경우 index가 높은 팝업이 낮은 팝업 위에 보여짐. (미입력시 기본값:1)
- position : window화면을 기준으로 팝업을 표시할 위치 지정 (미 입력시 top,left 기본값:30)
- target : 팝업을 호출한 버튼객체 (해당 값이 있는 경우 팝업이 뜰때 버튼이 안보였다가 팝업을 닫으면 다시 보임)
- title : 팝업상단에 헤더표시 (미 입력시 헤더없이 내용만 표시)
- include : 팝업창 content에 표시되어질 페이지의 경로
- scrolling : (on) 팝업창을 호출하면 자동으로 최상단으로 이동, (off) 팝업 호출 시 스크롤이동 없음 (기본값:on)
- scroll : (on) 팝업창 호출 시 메인화면의 전체 스크롤 보여짐, (off) 팝업창 호출 시 메인화면의 전체 스크롤 없애기 (기본값:off)
- move : (on) 헤더를 클릭 후 팝업을 움직일 수 있음, (off) 팝업이 오픈 된 위치에 고정되어 움직이지 않음 (기본값:on)
*/
function gfn_com_modalPopup(params, callback) {
	if (params.include) {
		var suffixStr = "";
		var zindex = 1;
		var bannerSize = 0;
		var _width = 0;
		var _height = 0;

		if (!params.index) {
			params.index = $("div[id^='popupWrap']").length + 1
		}
		for (var idx = 1; idx < params.index; idx++) {
			suffixStr += "_";
			zindex++;
		}

		if (gfn_str_parseNull(params.position) == "") {
			params.position = {
				top: (($(window).height() - params.height) / 2 + $('html, body').scrollTop()),
				left:   ($(window).width()<params.width)? 30: ( ($(window).width() - params.width)/ 2)     ,
				center: true
			}
		} else {
			params.position.center = false;
		}

		var divWallTag = $("<div id='modalWall" + suffixStr + "' popupdiv='popupWrap" + suffixStr + "' class='modal-wall-none' ></div>").css({ "zIndex": gfn_com_maxZindex(0) + zindex });
		var divPopWrapTag = $("<div id='popupWrap" + suffixStr + "' class='popup-wrap'></div>").css({ "zIndex": gfn_com_maxZindex(1) + zindex });
		var divPopTag = $("<div id='popup' class='popup' idx='" + params.index + "'>");
		if (params.title) {
			if (params.move && params.move == "off") {
				$(divPopTag).append($("<nav class='_navbar _navbar-default'><div class='_container'><h1 class='_navbar-brand'><span data-lang>" + params.title + "</span></h1></div><i class='pop_close' ><img src='/common/images/icon_pop_close.png' /></i></nav>"));
			} else {
				$(divPopTag).append($("<nav class='_navbar _navbar-default' onmousedown='fn_startDrag(event, this)'><div class='_container'><h1 class='_navbar-brand'><span data-lang>" + params.title + "</span></h1></div><i class='pop_close' ><img src='/common/images/icon_pop_close.png' /></i></nav>"));
			}
			if (params.scrolling && params.scrolling == "on") {
				$(divPopTag).append($("<div class='_container' style='height:" + ($(window).height() < (parseInt(gfn_str_parseNullDefault(params.height, "500")) + (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 30) + bannerSize) ? ($(window).height() - (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 100 + bannerSize)) - 45 : (parseInt(gfn_str_parseNullDefault(params.height - 50, "450"))) - 45) + "px'><div id='content' class='_subcont'></div></div>"));
			} else {
				$(divPopTag).append($("<div class='_container' style='height:" + (parseInt(params.height) - 45) + "px'><div id='content' class='_subcont'></div></div>"));
			}
		} else {
			if (params.scrolling && params.scrolling == "on") {
				$(divPopTag).append($("<div class='_container' style='height:" + ($(window).height() < (parseInt(gfn_str_parseNullDefault(params.height, "500")) + (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 30) + bannerSize) ? ($(window).height() - (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 100 + bannerSize)) - 45 : (parseInt(gfn_str_parseNullDefault(params.height, "500"))) - 45) + "px'><div id='content' class='_subcont'></div></div>"));
			} else {
				$("#popupWrap" + suffixStr).css("height", params.height);
				$(divPopTag).append($("<div class='_container' style='height:" + (parseInt(params.height) - 45) + "px'><div id='content' class='_subcont'></div></div>"));
			}

		}
		divPopWrapTag.append($(divPopTag));
		$(".mask").after(divPopWrapTag);
		$(".mask").after(divWallTag);
		if (params.scrolling && params.scrolling == "on") {
			$('html, body').animate({ scrollTop: $("#header").offset().top }, 500);
		} else {

		}
		if (params.scroll && params.scroll == "off") {
			/*if(params.scrolling && params.scrolling == "on") {
				$("html,body").css("overflow-y","hidden");
			} else {
				$("html,body").css("overflow-y","auto");
			}*/
			$("html,body").css("overflow-y", "hidden");
		} else {
			$("html,body").css("overflow-y", "auto");
		}
		$("#popupWrap" + suffixStr + " ._subcont").html("");
		if (params.modal && params.modal == "off") {

		} else {
			$("#modalWall" + suffixStr).attr("class", "modal-wall");
		}

		if (params.overflow_y && params.overflow_y == "off") {
			$("#popupWrap" + suffixStr + " ._container").css("overflow-y", "hidden");
		}
		$.get(params.include, "").done(function(data) {
			$("#popupWrap" + suffixStr + " ._subcont").html(data);
			$("#popupWrap" + suffixStr).css("width", ($(window).width() < (parseInt(gfn_str_parseNullDefault(params.width, "500")) + (parseInt(gfn_str_parseNullDefault(params.position.left, "25")) + 30)) ? ($(window).width() - (parseInt(gfn_str_parseNullDefault(params.position.left, "25")) + 25)) : (parseInt(gfn_str_parseNullDefault(params.width, "500")))) + "px");
			if (params.scrolling && params.scrolling == "on") {
				$("#popupWrap" + suffixStr).css("height", $(window).height() < (parseInt(gfn_str_parseNullDefault(params.height, "500")) + (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 30)) ? ($(window).height() - (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 55)) : (parseInt(gfn_str_parseNullDefault(params.height, "500"))) + "px");
				$("#popupWrap" + suffixStr).css("top", gfn_str_parseNullDefault(params.position.top + bannerSize, "30") + "px");
			} else {
				$("#popupWrap" + suffixStr).css("height", params.height);
				if (params.target) {
					$("#popupWrap" + suffixStr).css("top", gfn_str_parseNullDefault(($(params.target).offset().top - params.height), "30") + "px");
				} else {
					$("#popupWrap" + suffixStr).css("top", gfn_str_parseNullDefault(params.position.top + bannerSize, "30") + "px");
				}
			}
			
			$("#popupWrap" + suffixStr).css("left", gfn_str_parseNullDefault(params.position.left, "30") + "px");
			$('#popupWrap' + suffixStr).css('opacity', 0);
			$('#popupWrap' + suffixStr).show();
			$('#popupWrap' + suffixStr).animate({ opacity: 1 }, { queue: false, duration: 'slow' });
			if (params.scrolling && params.scrolling == "on") {
				$('#popupWrap' + suffixStr).animate({ top: (parseInt(gfn_str_parseNullDefault(params.position.top + (($("#top-banner").css("display") == "block") ? 110 : 0), "25")) + 30) + "px" }, 'slow');
			} else {
				if (params.target) {
					if (params.manual) {
						$('#popupWrap' + suffixStr).animate({ top: (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 30) + "px" }, 'slow');
					} else {
						$('#popupWrap' + suffixStr).animate({ top: (parseInt(gfn_str_parseNullDefault(($(params.target).offset().top - params.height), "25")) + 30) + "px" }, 'slow');
					}
				} else {
					$('#popupWrap' + suffixStr).animate({ top: (parseInt(gfn_str_parseNullDefault(params.position.top + bannerSize, "25")) + 30) + "px" }, 'slow');
				}
			}
			$("#popupWrap" + suffixStr).focus();

			$.each($("#popupWrap" + suffixStr + " .calendar"), function(idx) {
				var obj = $("#popupWrap" + suffixStr + " .calendar")[idx];
				if (!$(obj).is("[readonly]")) {
					if (!gfn_com_isEmptyObject($(obj).attr("id"))) {
						gfn_com_createDateComp($(obj).attr("id"));
					}
				}
			});

			$.each($("#popupWrap" + suffixStr + " .datepicker"), function(idx) {
				var obj = $("#popupWrap" + suffixStr + " .datepicker")[idx];
				if (!$(obj).is("[readonly]")) {
					if (!gfn_com_isEmptyObject($(obj).attr("id"))) {
						gfn_com_createDatetimeComp($(obj).attr("id"), "YYYY-MM-DD", false);
					}
				}
			});

			$.each($("#popupWrap" + suffixStr + " .timepicker"), function(idx) {
				var obj = $("#popupWrap" + suffixStr + " .timepicker")[idx];
				if (!$(obj).is("[readonly]")) {
					if (!gfn_com_isEmptyObject($(obj).attr("id"))) {
						gfn_com_createDatetimeComp($(obj).attr("id"), "HH:mm:ss", true);
					}
				}
			});

			$.each($("#popupWrap" + suffixStr + " .datetimepicker"), function(idx) {
				var obj = $("#popupWrap" + suffixStr + " .datetimepicker")[idx];
				if (!$(obj).is("[readonly]")) {
					if (!gfn_com_isEmptyObject($(obj).attr("id"))) {
						gfn_com_createDatetimeComp($(obj).attr("id"), "YYYY-MM-DD HH:mm:ss", true);
					}
				}
			});

			$.each($("#popupWrap" + suffixStr + " .sliderpointer"), function(idx) {
				if (!gfn_com_isEmptyObject($(this).attr("id"))) {
					gfn_com_createSliderComp($(this).attr("id"));
				}
			});

			$.each($("#popupWrap" + suffixStr + " input[auto-bind], #popupWrap" + suffixStr + " select[auto-bind]"), function(idx) {
				var obj = $("#popupWrap" + suffixStr + " input[auto-bind], #popupWrap" + suffixStr + " select[auto-bind]")[idx];
				$(obj).css('width', $("#" + $(obj).attr("auto-bind")).width() + 26);
				$(window).resize(function(e) {
					$(obj).css('width', $("#" + $(obj).attr("auto-bind")).width() + 26);
				});
			});

			if (params.scrolling && params.scrolling == "on") {

			} else {
				if (params.target) {
					$('html, body').animate({ scrollTop: gfn_str_parseNullDefault(($(params.target).offset().top - params.height), "30") }, 500);
				}
			}

			if (params.target) {
				$(params.target).hide();
				$("#popupWrap" + suffixStr).bind('hide', function() {
					$(params.target).show();
				});
			}
			if (params.positioning) {
				$("#popupWrap" + suffixStr).css("position", params.positioning)
			}
			if (typeof callback == "function") {
				callback();
			}
			$("#popupWrap" + suffixStr + " .pop_close").bind("click", function() {
				gfn_com_closeModalWall(params.index, (params.closeEvent ? params.closeEvent : null));
			});

			if ($("#popupWrap" + suffixStr + " ._footer").length > 0) {
				$("#popupWrap" + suffixStr + " ._container:eq(1)").height($("#popupWrap" + suffixStr + " ._container:eq(1)").height() - 55);
			}

			var _width = ($("#popupWrap" + suffixStr).width() < params.width) ? params.width : $("#popupWrap" + suffixStr).width();
			var _height = ($("#popupWrap" + suffixStr).height() < params.height) ? params.height : $("#popupWrap" + suffixStr).height();
			params.width = _width;
			params.height = _height;
			var _left = 0;
			var _top = 0;

			if (params.position.center) {
				/*pop_resizing(_width,suffixStr,params,_height,_top,_left);*/
			}

			$(window).resize(function(e) {
				pop_resizing(_width, suffixStr, params, _height, _top, _left);
			});
			loadscript($(divPopWrapTag), "/common/bootstrap-table-master/dist/bootstrap-table.min.js");
			$(".numeric").numeric();

			if (typeof params.dataBound == "function") {
				params.dataBound();
			} else if (typeof params.dataBound == "string") {
				window[params.dataBound]();
			}
		});
	}
}



function gfn_com_noticeModalPopup(params, callback) {
		var suffixStr = "";
		var zindex = 1;
		var bannerSize = 0;
		var _width = 0;
		var _height = 0;
		params.id = gfn_str_parseNull(params.id);
		if (!params.index) {
			params.index = $("div[id^='popupWrap']").length + 1
		}
		for (var idx = 1; idx < params.index; idx++) {
			suffixStr += "_";
			zindex++;
		}

		if (gfn_str_parseNull(params.position) == "") {
			params.position = {
				top: (($(window).height() - params.height) / 2 + $('html, body').scrollTop()),
				left: (($(window).width() - params.width) / 2),
				center: true
			}
		} else {
			params.position.center = false;
		}

		var divWallTag = "";
		if ((params.id).indexOf('noticePopup') < 0 || (params.id).indexOf('noticePopup0') > -1) {
			divWallTag = $("<div id='modalWall" + suffixStr + "' popupdiv='popupWrap" + suffixStr + "' class='modal-wall-none' ></div>").css({ "zIndex": gfn_com_maxZindex(0) + zindex });
		}
		var divPopWrapTag = $("<div id='popupWrap" + suffixStr + "' class='popup-wrap notice-popup-wrap " + params.id + "'></div>").css({ "zIndex": gfn_com_maxZindex(1) + zindex });
		var divPopTag = $("<div id='popup' class='popup' idx='" + params.index + "'>");
		if (params.title) {

			if ((params.id).indexOf('noticePopup') > -1) {
				if (params.move && params.move == "off") {
					$(divPopTag).append($("<nav class='_navbar _navbar-default'><div class='_container'><h1 class='_navbar-brand'><span data-lang>" + params.title + "</span></h1></div><i class='pop_close' ><img src='/common/images/icon_pop_close.png' /></i></nav>"));
				} else {
					$(divPopTag).append($("<nav class='_navbar _navbar-default' onmousedown='fn_startDrag(event, this)'><div class='_container'><h1 class='_navbar-brand'><span data-lang>" + params.title + "</span></h1></div><i class='pop_close' ><img src='/common/images/icon_pop_close.png' /></i></nav>"));
				}
				if(params.fileList.length > 0){
					var attach_html = "";
					attach_html +="<div class='popup-attach'>";
					attach_html +="	<div class='attach-label'>첨부파일</div>";
					attach_html +="	<ul class='attach-list'>";
					$.each(params.fileList, function(idx, obj) {
						attach_html +="		<li><a href='/file/download.do?"+obj.PARAM_CODE+"'>"+obj.ORIGIN_FILE_NM+"</a></li>";
					});
					attach_html +="	</ul>";
					attach_html +="</div>";
					$(divPopTag).append(attach_html);
				}
				if (params.scrolling && params.scrolling == "on") {
					$(divPopTag).append($("<div class='_container' style='height:" + ($(window).height() < (parseInt(gfn_str_parseNullDefault(params.height, "500")) + (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 30) + bannerSize) ? ($(window).height() - (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 100 + bannerSize)) - 45 : (parseInt(gfn_str_parseNullDefault(params.height - 50, "450"))) - 45) + "px'><div id='content' class='_subcont'></div></div>"));
				} else {
					$(divPopTag).append($("<div class='_container' ><div id='content' class='_subcont'></div></div>"));
				}
				
				if(params.linkMenuCd != ""){
					$(divPopTag).append("<div class='modal_link' style='padding:12px'><a href='javascript:selectMenu(\""+params.linkMenuCd+"\")' class='btn btn-light d-block mt-1 p-3' >관련 페이지로 이동</a></div>");	
				}
				
				var footer_html = "";
				footer_html +="<div class='modal-footer'>";
				footer_html +="<div class='w2group check-box'>                                                                                                                         ";
				footer_html +="	<div class='w2group '>                                                                                                                                 ";
				footer_html +="		<input id='closeDate' style='float: left;' class=' form-control form-w-xs' type='text' maxlength='2' value='"+params.closeDayCnt+"'>                                            ";
				footer_html +="		<div id='' style='cursor: pointer; display: inline-block; margin-top: 3px;' class='w2textbox '>일간 열지않기</div>                                 ";
				footer_html +="		<div class='custom-control custom-checkbox custom-control-inline'>		";
				footer_html +="		<input type='checkbox' id='closecChk' class='custom-control-input'>"; 		
				footer_html +="		<label class='custom-control-label' for='closecChk'></label>";
				footer_html +="	</div>";
				footer_html +="</div>                                                                                                                                                 ";
				footer_html +="</div>                                                                                                                                                  ";
				footer_html +="		<button type='button' class='btn btn-secondary close_btn' data-dismiss='modal'>닫기</button>";
				footer_html +="</div>";
				$(divPopTag).append(footer_html);
			} 


		} else {
			if (params.scrolling && params.scrolling == "on") {
				$(divPopTag).append($("<div class='_container' style='height:" + ($(window).height() < (parseInt(gfn_str_parseNullDefault(params.height, "500")) + (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 30) + bannerSize) ? ($(window).height() - (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 100 + bannerSize)) - 45 : (parseInt(gfn_str_parseNullDefault(params.height, "500"))) - 45) + "px'><div id='content' class='_subcont'></div></div>"));
			} else {
				$("#popupWrap" + suffixStr).css("height", params.height);
				$(divPopTag).append($("<div class='_container' style='height:" + (parseInt(params.height) - 45) + "px'><div id='content' class='_subcont'></div></div>"));
			}

		}
		divPopWrapTag.append($(divPopTag));
		$(".mask").after(divPopWrapTag);
		$(".mask").after(divWallTag);
		if (params.scrolling && params.scrolling == "on") {
			$('html, body').animate({ scrollTop: $("#header").offset().top }, 500);
		} else {

		}
		if (params.scroll && params.scroll == "off") {
			/*if(params.scrolling && params.scrolling == "on") {
				$("html,body").css("overflow-y","hidden");
			} else {
				$("html,body").css("overflow-y","auto");
			}*/
			$("html,body").css("overflow-y", "hidden");
		} else {
			$("html,body").css("overflow-y", "auto");
		}
		$("#popupWrap" + suffixStr + " ._subcont").html("");
		if (params.modal && params.modal == "off") {

		} else {
			$("#modalWall" + suffixStr).attr("class", "modal-wall");
		}

		if (params.overflow_y && params.overflow_y == "off") {
			$("#popupWrap" + suffixStr + " ._container").css("overflow-y", "hidden");
		}
			$("#popupWrap" + suffixStr + " ._subcont").html(params.content);
			$("#popupWrap" + suffixStr).css("width", ($(window).width() < (parseInt(gfn_str_parseNullDefault(params.width, "500")) + (parseInt(gfn_str_parseNullDefault(params.position.left, "25")) + 30)) ? ($(window).width() - (parseInt(gfn_str_parseNullDefault(params.position.left, "25")) + 25)) : (parseInt(gfn_str_parseNullDefault(params.width, "500")))) + "px");
			if (params.scrolling && params.scrolling == "on") {
				$("#popupWrap" + suffixStr).css("height", $(window).height() < (parseInt(gfn_str_parseNullDefault(params.height, "500")) + (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 30)) ? ($(window).height() - (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 55)) : (parseInt(gfn_str_parseNullDefault(params.height, "500"))) + "px");
				$("#popupWrap" + suffixStr).css("top", gfn_str_parseNullDefault(params.position.top + bannerSize, "30") + "px");
			} else {
				$("#popupWrap" + suffixStr).css("height", params.height);
				if (params.target) {
					$("#popupWrap" + suffixStr).css("top", gfn_str_parseNullDefault(($(params.target).offset().top - params.height), "30") + "px");
				} else {
					$("#popupWrap" + suffixStr).css("top", gfn_str_parseNullDefault(params.position.top + bannerSize, "30") + "px");
				}
			}
			$("#popupWrap" + suffixStr).css("left", gfn_str_parseNullDefault(params.position.left, "30") + "px");
			$('#popupWrap' + suffixStr).css('opacity', 0);
			$('#popupWrap' + suffixStr).show();
			$('#popupWrap' + suffixStr).animate({ opacity: 1 }, { queue: false, duration: 'slow' });
			if (params.scrolling && params.scrolling == "on") {
				$('#popupWrap' + suffixStr).animate({ top: (parseInt(gfn_str_parseNullDefault(params.position.top + (($("#top-banner").css("display") == "block") ? 110 : 0), "25")) + 30) + "px" }, 'slow');
			} else {
				if (params.target) {
					if (params.manual) {
						$('#popupWrap' + suffixStr).animate({ top: (parseInt(gfn_str_parseNullDefault(params.position.top, "25")) + 30) + "px" }, 'slow');
					} else {
						$('#popupWrap' + suffixStr).animate({ top: (parseInt(gfn_str_parseNullDefault(($(params.target).offset().top - params.height), "25")) + 30) + "px" }, 'slow');
					}
				} else {
					$('#popupWrap' + suffixStr).animate({ top: (parseInt(gfn_str_parseNullDefault(params.position.top + bannerSize, "25")) + 30) + "px" }, 'slow');
				}
			}
			$("#popupWrap" + suffixStr).focus();

			$.each($("#popupWrap" + suffixStr + " .calendar"), function(idx) {
				var obj = $("#popupWrap" + suffixStr + " .calendar")[idx];
				if (!$(obj).is("[readonly]")) {
					if (!gfn_com_isEmptyObject($(obj).attr("id"))) {
						gfn_com_createDateComp($(obj).attr("id"));
					}
				}
			});

			$.each($("#popupWrap" + suffixStr + " .datepicker"), function(idx) {
				var obj = $("#popupWrap" + suffixStr + " .datepicker")[idx];
				if (!$(obj).is("[readonly]")) {
					if (!gfn_com_isEmptyObject($(obj).attr("id"))) {
						gfn_com_createDatetimeComp($(obj).attr("id"), "YYYY-MM-DD", false);
					}
				}
			});

			$.each($("#popupWrap" + suffixStr + " .timepicker"), function(idx) {
				var obj = $("#popupWrap" + suffixStr + " .timepicker")[idx];
				if (!$(obj).is("[readonly]")) {
					if (!gfn_com_isEmptyObject($(obj).attr("id"))) {
						gfn_com_createDatetimeComp($(obj).attr("id"), "HH:mm:ss", true);
					}
				}
			});

			$.each($("#popupWrap" + suffixStr + " .datetimepicker"), function(idx) {
				var obj = $("#popupWrap" + suffixStr + " .datetimepicker")[idx];
				if (!$(obj).is("[readonly]")) {
					if (!gfn_com_isEmptyObject($(obj).attr("id"))) {
						gfn_com_createDatetimeComp($(obj).attr("id"), "YYYY-MM-DD HH:mm:ss", true);
					}
				}
			});

			$.each($("#popupWrap" + suffixStr + " .sliderpointer"), function(idx) {
				if (!gfn_com_isEmptyObject($(this).attr("id"))) {
					gfn_com_createSliderComp($(this).attr("id"));
				}
			});

			$.each($("#popupWrap" + suffixStr + " input[auto-bind], #popupWrap" + suffixStr + " select[auto-bind]"), function(idx) {
				var obj = $("#popupWrap" + suffixStr + " input[auto-bind], #popupWrap" + suffixStr + " select[auto-bind]")[idx];
				$(obj).css('width', $("#" + $(obj).attr("auto-bind")).width() + 26);
				$(window).resize(function(e) {
					$(obj).css('width', $("#" + $(obj).attr("auto-bind")).width() + 26);
				});
			});

			if (params.scrolling && params.scrolling == "on") {

			} else {
				if (params.target) {
					$('html, body').animate({ scrollTop: gfn_str_parseNullDefault(($(params.target).offset().top - params.height), "30") }, 500);
				}
			}

			if (params.target) {
				$(params.target).hide();
				$("#popupWrap" + suffixStr).bind('hide', function() {
					$(params.target).show();
				});
			}
			if (params.positioning) {
				$("#popupWrap" + suffixStr).css("position", params.positioning)
			}
			if (typeof callback == "function") {
				callback();
			}
			$("#popupWrap" + suffixStr + " .pop_close , #popupWrap" + suffixStr + " .close_btn"  ).bind("click", function() {
				if ((params.id).indexOf('noticePopup') > -1) {
					if ($("." + params.id).find("#closecChk").is(":checked")) {
						if ($("." + params.id).find("#closeDate").val() == "") {
							alert("본 팝업을 열지않을 일수를 입력 하세요.");
							return false;
						} else {
							gfn_com_setCookie(params.id, 'N', $("." + params.id).find("#closeDate").val());
							gfn_com_closeModalWall(params.index, (params.closeEvent ? params.closeEvent : null));
						}

					} else {
						gfn_com_closeModalWall(params.index, (params.closeEvent ? params.closeEvent : null));
					}
				} 

			});

			if ($("#popupWrap" + suffixStr + " ._footer").length > 0) {
				$("#popupWrap" + suffixStr + " ._container:eq(1)").height($("#popupWrap" + suffixStr + " ._container:eq(1)").height() - 55);
			}
			
			if ((params.id).indexOf('noticePopup') > -1) {
				$("#popupWrap" + suffixStr + " ._container:eq(1)").height((parseInt(params.height) - 150)-gfn_str_parseNull($("#popupWrap" + suffixStr + " .modal_link").outerHeight())-gfn_str_parseNull($("#popupWrap" + suffixStr + " .popup-attach").outerHeight()));
			}
			
			var _width = ($("#popupWrap" + suffixStr).width() < params.width) ? params.width : $("#popupWrap" + suffixStr).width();
			var _height = ($("#popupWrap" + suffixStr).height() < params.height) ? params.height : $("#popupWrap" + suffixStr).height();
			params.width = _width;
			params.height = _height;
			var _left = 0;
			var _top = 0;

			if (params.position.center) {
				/*pop_resizing(_width,suffixStr,params,_height,_top,_left);*/
			}

			$(window).resize(function(e) {
				pop_resizing(_width, suffixStr, params, _height, _top, _left);
			});
			loadscript($(divPopWrapTag), "/common/bootstrap-table-master/dist/bootstrap-table.min.js");
			$(".numeric").numeric();

			if (typeof params.dataBound == "function") {
				params.dataBound();
			} else if (typeof params.dataBound == "string") {
				window[params.dataBound]();
			}

}

function pop_resizing(_width, suffixStr, params, _height, _top, _left) {
	if ((_width + 40) > $(window).width()) {
		_width = $(window).width() - 40;
		$("#popupWrap" + suffixStr).css('width', _width);
	} else {
		if (params.width > _width) {
			_width = ($(window).width() - 40) < params.width ? ($(window).width() - 40) : params.width;
			$("#popupWrap" + suffixStr).css('width', _width);
		}
	}
	if ((_height + 40) > $(window).height()) {
		_height = $(window).height() - 40;
		$("#popupWrap" + suffixStr).css('height', _height);
		if ($("#popupWrap" + suffixStr + " ._footer").length > 0) {
			$("#popupWrap" + suffixStr + " ._container:eq(1)").css('height', _height - 100);
		}
	} else {
		if (params.height > _height) {
			_height = ($(window).height() - 40) < params.height ? ($(window).height() - 40) : params.height;
			$("#popupWrap" + suffixStr).css('height', _height);
			if ($("#popupWrap" + suffixStr + " ._footer").length > 0) {
				$("#popupWrap" + suffixStr + " ._container:eq(1)").css('height', _height - 100);
			}
		}
	}
	_top = (($(window).height() - _height) / 2 + $('html, body').scrollTop());
	_left = (($(window).width() - _width) / 2);

	$("#popupWrap" + suffixStr).css("top", _top + "px");
	$("#popupWrap" + suffixStr).css("left", _left + "px");
}

function gfn_com_enterFunc(e, callback) {
	if (e.keyCode == 13 && typeof callback == "function") {
		callback();
	}
}

function gfn_com_checkBoxAllChk(name, id) {
	if (gfn_com_isEmptyObject(name)) {
		return;
	}
	if (gfn_com_isEmptyObject(id)) {
		return;
	}
	var chk = $("#" + id).prop("checked");
	var objs = $("[name=" + name + "]");
	$.each(objs, function(i) {
		$(objs[i]).prop("checked", chk);
	});
}

function gfn_com_createDateComp(compID, options) {
	if (gfn_com_isEmptyObject(options)) {
		$("#" + compID).wrap('<div class="input-group"></div>');
		$("#" + compID).datepicker();
		$("#" + compID).parent().find(".ui-datepicker-trigger").addClass('btn form-control').wrap('<div class="input-group-append">');
	} else {
		$("#" + compID).wrap('<div class="input-group"></div>');
		$("#" + compID).datepicker(options);
		$("#" + compID).parent().find(".ui-datepicker-trigger").addClass('btn form-control').wrap('<div class="input-group-append">');
	}
}

function gfn_com_createDatetimeComp(compID, _format, _flag) {
	$("#" + compID).wrap('<div class="input-group"></div>');
	$("#" + compID).datetimepicker({
		locale: "ko",
		allowInputToggle: true,
		showClose: _flag,
		showClear: _flag,
		showTodayButton: _flag,
		format: _format,
		dayViewHeaderFormat: "YYYY MMMM",
		useCurrent: false,
		icons: {
			time: 'bi bi-clock',
			date: 'bi bi-calendar',
			up: 'bi bi-chevron-up',
			down: 'bi bi-chevron-down',
			previous: 'bi bi-chevron-left',
			next: 'bi bi-chevron-right',
			today: 'bi bi-bag-check',
			clear: 'bi bi-trash',
			close: 'bi bi-x-circle'
		},
		sideBySide: false,
		tooltips: {
			today: '오늘',
			clear: '초기화',
			close: '닫기',
			selectMonth: '월 선택',
			prevMonth: '이전 월',
			nextMonth: '다음 월',
			selectYear: '년도 선택',
			prevYear: '이전 년도',
			nextYear: '다음 년도',
			selectTime: '시간 선택',
			selectDecade: 'Select Decade',
			prevDecade: 'Previous Decade',
			nextDecade: 'Next Decade',
			prevCentury: 'Previous Century',
			nextCentury: 'Next Century'
		}
	});
	$("#" + compID).after('<div class="input-group-append"><button type="button" class="btn form-control"><i class="bi bi-calendar-event"></i></button></div>');
	$("#" + compID).parent().find("button").click(function() {
		$("#" + compID).data("DateTimePicker").toggle();
	});
}

function gfn_com_createDateTimeComp2(compID, options) {
	if (gfn_com_isEmptyObject(options)) {
		$("#" + compID).wrap('<div class="input-group"></div>');
		$("#" + compID).datetimepicker2();
		$("#" + compID).parent().find(".ui-datepicker-trigger").addClass('btn form-control').wrap('<div class="input-group-append">');
	} else {
		$("#" + compID).wrap('<div class="input-group"></div>');
		$("#" + compID).datetimepicker2(options);
		$("#" + compID).parent().find(".ui-datepicker-trigger").addClass('btn form-control').wrap('<div class="input-group-append">');
	}
}

function gfn_com_createProfSearchComp(compID) {
	$("#" + compID).wrap('<div id="' + compID + '_wrap" class="input-group"></div>');
	$("#" + compID).parent().append('<input type="hidden" id="' + compID + '_hidden"  value="" /><div class="input-group-append"><button type="button" class="btn form-control"><i class="bi bi-search"></i></button></div>');

	if ($("#" + compID).attr('placeholder') == undefined) {
		$("#" + compID).attr('placeholder', '교원번호/이름');
	}

	$("#" + compID + "_wrap button").click(function(e) {
		gfn_com_ProfSearchPop(compID);
	});
	$("#" + compID).keyup(function(key) {
		if (key.keyCode == 13) {
			gfn_com_ProfSearchPop(compID);
		} else {
			if ($("#" + compID + "_hidden").val() != "") {
				$("#" + compID + "_hidden").val("");
				$("#" + compID + "_hidden").removeData();
				$("#" + compID).css("background-color", "");
				if ($("#" + compID).attr("callbackFunc") != undefined) {
					window[$("#" + compID).attr("callbackFunc")]({});
				}
			}
		}
	});
}

function gfn_com_ProfSearchPop(compID) {

	if ($("#" + compID).val() != undefined && $("#" + compID).val().length > 1) {
		scwin["profSearchPop"] = {
			compid: compID
		}
		gfn_com_modalPopup({
			width: 1200,
			height: 700,
			target: null,
			title: "교원검색팝업",
			include: "/html/ost/core/popup/search/profSearchPop.html"
		});
	} else {
		alert('검색할 교원의 교원번호 또는 이름을 2글자 이상 입력 하세요.');
	}
}

function gfn_com_createSliderComp(compID) {
	$("#" + compID).hide();
	$("#" + compID).after('<div id="' + compID + '_slide_txt" class="slidetxt sliderpointer"></div><div id="' + compID + '_slide" class="form-control slide"></div>');
	$("#" + compID + "_slide").slider({
		value: 50,
		step: 5,
		orientation: "horizontal",
		slide: function(e, ui) {
			$("#" + compID).val(ui.value);
			$("#" + compID + "_slide_txt").text(ui.value + " 점");
		}
	});
	$("#" + compID).numeric();
	$("#" + compID).attr("maxlength", 3);
	$("#" + compID).val('50');
	$("#" + compID + "_slide_txt").text("50 점");
	$("#" + compID).keyup(function(key) {
		$("#" + compID + "_slide span").css({ left: gfn_str_parseNullZero($(this).val()) + "%" });
	});
}

function gfn_com_createSliderComps(obj) {
	setTimeout(function() {
		$.each($(obj), function(idx) {
			if (!gfn_com_isEmptyObject($(this).attr("id"))) {
				gfn_com_createSliderComp($(this).attr("id"));
			}
		});
	}, 300);
}



/* 
 * 같은 값이 있는 열을 병합함
 * 사용법 : $('#테이블 ID').rowspan(0);
 */
$.fn.rowspan = function(colIdx, isStats) {
	return this.each(function() {
		var that;
		$('tr', this).each(function(row) {
			$('td:eq(' + colIdx + ')', this).filter(':visible').each(function(col) {
				if ($(that).html() != "" && $(this).html() == $(that).html()
					&& (!isStats
						|| isStats && $(this).prev().html() == $(that).prev().html())) {
					rowspan = $(that).attr("rowspan") || 1;
					rowspan = Number(rowspan) + 1;
					$(that).attr("rowspan", rowspan);
					$(this).hide();
					$(that).addClass("rowspanstyle");
				} else {
					that = this;
				}
				that = (that == null) ? this : that;
			});
		});
	});
};


/* 
 * 같은 값이 있는 행을 병합함
 * 사용법 : $('#테이블 ID').colspan (0);
 */
$.fn.colspan = function(rowIdx) {
	return this.each(function() {
		var that;
		$('tr', this).filter(":eq(" + rowIdx + ")").each(function(row) {
			$(this).find('td').filter(':visible').each(function(col) {
				if ($(that).html() != "" && $(this).html() == $(that).html()) {
					colspan = $(that).attr("colspan") || 1;
					colspan = Number(colspan) + 1;

					$(that).attr("colspan", colspan);
					$(this).hide();
				} else {
					that = this;
				}
				that = (that == null) ? this : that;

			});
		});
	});
}

/* 
 * 같은 값이 있는 행을 병합함 Ver2
 * 사용법 : $('#테이블 ID').colspan (0);
 */
$.fn.colspanV2 = function(rowIdx) {
	return this.each(function() {
		var that;
		$('tr', this).filter(":eq(" + rowIdx + ")").each(function(row) {
			$(this).find('td').filter(':visible').each(function(col) {
				if ($(that).html() != "" && $(this).html() == $(that).html() && $(this).attr("cp") == "colMerge") {
					colspan = $(that).attr("colspan") || 1;
					colspan = Number(colspan) + 1;

					$(that).attr("colspan", colspan);
					$(this).hide();
				} else {
					that = this;
				}
				that = (that == null) ? this : that;
			});
		});
	});
}

//테이블 td 에 같은 내용이 있는 row를 합쳐주는 함수
$.fn.rowspans = function(colIdx,isStats) {
	return this.each(function() {
		var that;
		$('tr', this).each(function(row) {
			$('th:eq(' + colIdx + ')', this).filter(':visible').each(function(col) {
				if ($(that).html() != "" && $(this).html() == $(that).html()
					&& (!isStats
						|| isStats && $(this).prev().html() == $(that).prev().html())) {
					rowspan = $(that).attr("rowspan") || 1;
					rowspan = Number(rowspan) + 1;
					$(that).attr("rowspan", rowspan);
					$(this).hide();
					$(that).addClass("rowspanstyle");
				} else {
					that = this;
				}
				that = (that == null) ? this : that;
			});
		});
	});
};

var LayerPopup;

window.alert = function(msg, callBack) {
	LayerPopup.alert(msg, callBack);
}

window.confirm = function(msg, callBack, conf, canc) {
	LayerPopup.confirm(msg, conf, canc, callBack);
}

function fn_focusScroll(_obj) {
	$(_obj).focus();
	if ($(_obj).closest(".popup").length == 0) {
		$('html, body').animate({ scrollTop: $(_obj).offset().top - 82 }, 500);
	}
}

function gfn_com_inputTimeColon(time) {
	// replace 함수를 사용하여 콜론( : )을 공백으로 치환한다.
	var replaceTime = time.value.replace(/\:/g, "");

	// 텍스트박스의 입력값이 4~5글자 사이가 되는 경우에만 실행한다.
	if (replaceTime.length >= 4 && replaceTime.length < 5) {

		var hours = replaceTime.substring(0, 2);      // 선언한 변수 hours에 시간값을 담는다.
		var minute = replaceTime.substring(2, 4);    // 선언한 변수 minute에 분을 담는다.

		// isFinite함수를 사용하여 문자가 선언되었는지 확인한다.
		if (isFinite(hours + minute) == false) {
			alert("문자는 입력하실 수 없습니다.");
			time.value = "00:00";
			return false;
		}

		// 두 변수의 시간과 분을 합쳐 입력한 시간이 24시가 넘는지를 체크한다.
		if (hours + minute > 2400) {
			alert("시간은 24시를 넘길 수 없습니다.");
			time.value = "24:00";
			return false;
		}

		// 입력한 분의 값이 60분을 넘는지 체크한다.
		if (minute > 60) {
			alert("분은 60분을 넘길 수 없습니다.");
			time.value = hours + ":00";
			return false;
		}
		time.value = hours + ":" + minute;
	}
}

gfn_com_getMatchedJSON = function(map, key, value) {
	var json = new Array();

	for (var prop in map) {
		if (map[prop][key] == value)
			json.push(map[prop]);
	}
	return json;
};

s2ab = function(s) {
	var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
	var view = new Uint8Array(buf);  //create uint8array as viewer
	for (var i = 0; i < s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
	return buf;
}


fn_fileComplete = function(attach_file_grp_cd) {
	var options = {};
	options.url = '/file/fileTransComplete';
	options.reqData = {
		ATTACH_FILE_GRP_CD: attach_file_grp_cd
	};
	options.success = function(data, responseData) {
		alert("완료처리");
	};
	gfn_ajax_request(options);
}

fn_fileComplete2 = function(reqData) {
	var options = {};
	options.url = '/file/fileTransComplete';
	options.reqData = reqData;
	options.success = function(data, responseData) {
		alert("완료처리");
	};
	gfn_ajax_request(options);
}

fn_popupOpen = function(option, form) {
	var name = option.name;
	var url = "";
	if (option.url != null && option.url != "") url = option.url;
	var option_str = "";

	//default 셋팅
	if (gfn_str_parseNull(option.width)) option.width = "400";
	if (gfn_str_parseNull(option.height)) option.height = "400";
	if (gfn_str_parseNull(option.toolbar)) option.toolbar = "no";
	if (gfn_str_parseNull(option.menubar)) option.menubar = "no";
	if (gfn_str_parseNull(option.location)) option.location = "no";
	if (gfn_str_parseNull(option.scrollbars)) option.scrollbars = "no";
	if (gfn_str_parseNull(option.status)) option.status = "no";
	if (gfn_str_parseNull(option.resizable)) option.resizable = "no";

	// 옵션 적용
	if (!gfn_str_parseNull(option.width)) option_str += "width=" + option.width
	if (!gfn_str_parseNull(option.height)) option_str += ", height=" + option.height
	if (!gfn_str_parseNull(option.toolbar)) option_str += ", toolbar=" + option.toolbar
	if (!gfn_str_parseNull(option.menubar)) option_str += ", menubar=" + option.menubar
	if (!gfn_str_parseNull(option.location)) option_str += ", location=" + option.location
	if (!gfn_str_parseNull(option.scrollbars)) option_str += ", scrollbars=" + option.scrollbars
	if (!gfn_str_parseNull(option.status)) option_str += ", status=" + option.status
	if (!gfn_str_parseNull(option.resizable)) option_str += ", resizable=" + option.resizable
	if (!gfn_str_parseNull(option.fullscreen)) option_str += ", fullscreen=" + option.fullscreen
	if (!gfn_str_parseNull(option.channelmode)) option_str += ", channelmode=" + option.channelmode
	if (!gfn_str_parseNull(option.left)) option_str += ", left=" + option.left
	if (!gfn_str_parseNull(option.top)) option_str += ", top=" + option.top

	var win_pop = window.open(url, name, option_str);

	if (form != null && form != "") {
		form.target = name;
		form.submit();
	}

	return win_pop;
}


fn_popupMultiFileViewr = function(down_url) {
	if (scwin.loginUser.userIp == "127.0.0.1" || scwin.loginUser.userIp == "0:0:0:0:0:0:0:1") {
		alert("파일뷰어는 운영사이트에서만 지원 됩니다.");
		return false;
	}
	var host = "https://" + scwin.host;
	$("#popupFileViewerForm").remove();

	var $form = $("<form></form>");
	$form.prop("action", "https://dv.pusan.ac.kr/SynapDocViewServer/job");
	$form.prop("id", "popupFileViewerForm");
	$form.prop("name", "popupFileViewerForm");
	$form.prop("method", "post");
	$form.appendTo("body");

	var fid = $('<input type="hidden" name="fid" value="SES_HOME_' + ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1) + '">');
	var filePath = $('<input type="hidden" name="filePath" value="' + host + down_url + '">');
	var convertType = $('<input type="hidden" name="convertType" value="0">');
	var fileType = $('<input type="hidden" name="fileType" value="URL">');
	var downloadUrl = $('<input type="hidden" name="downloadUrl" value="' + host + down_url + '">');
	var convertType = $('<input type="hidden" name="sync" value="true">');

	$form.append(fid).append(filePath).append(convertType).append(fileType).append(downloadUrl).append(convertType);

	var option = {
		name: "openFileViewerPop",
		width: "500",
		height: "700",
		scrollbars: "yes",
		resizable: "yes"
	};
	var frm = document.popupFileViewerForm;

	fn_popupOpen(option, frm);
}

function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
  }

$.fn.hasVerticalScrollBar = function() {
		return this.get(0) ? this.get(0).scrollHeight > this.innerHeight(): false;
}