

function Tabfocuser() {
	
}

$.extend(Tabfocuser.prototype, {
	_SetConfig : function(target, options) {
		inst = {};
		inst.settings = $.extend({},  options || {});
		inst.settings.target = target;
		$("#"+inst.settings.target.attr("id")+' [role="tablist"]:eq(0)').parent().prepend('<p class="sr-only">탭메뉴는 좌우키방향키로 선택가능합니다.</p>');
		
		inst.settings.tablist = document.querySelectorAll("#"+inst.settings.target.attr("id")+' [role="tablist"]')[0];
		inst.settings.tabs = [];
		inst.settings.panels;
		
		$.tabfocuser.generateArrays(inst);
		if(inst.settings.tabs.length ==0 ){
			return;
		}
	
		inst.settings.delay = $.tabfocuser.determineDelay(inst);
		// For easy reference
		inst.settings.keys = {
			end: 35,
			home: 36,
			left: 37,
			up: 38,
			right: 39,
			down: 40,
			delete: 46
		};

		// Add or substract depending on key pressed
		inst.settings.direction = {
			37: -1,
			38: -1,
			39: 1,
			40: 1
		};

		// Bind listeners
		for (i = 0; i < inst.settings.tabs.length; ++i) {
			$.tabfocuser.addListeners(i,inst);
			if(i > 0){
				inst.settings.tabs[i].setAttribute('tabindex', '-1');	
			}
		};

	},




	generateArrays : function(inst) {
		//inst.settings.tabs = document.querySelectorAll("#"+inst.settings.target.attr("id")+' [role="tab"]');
		//inst.settings.panels = document.querySelectorAll("#"+inst.settings.target.attr("id")+' [role="tabpanel"]');
		//inst.settings.tabs = inst.settings.target.find("[role='tablist']").eq(0).find('[role="tab"]');//document.querySelectorAll("#"+inst.settings.target.attr("id")+' [role="tab"]');
		let tabs_idx = 0;
		$.each(inst.settings.target.find("[role='tablist']").eq(0).find('[role="tab"]'),function (i,e){
			if($(this).closest("li").css("display") !="none"){
				inst.settings.tabs[tabs_idx] = this;
				tabs_idx ++;
			}
		});
		inst.settings.panels = inst.settings.target.find(".tab-content").eq(0).children('[role="tabpanel"]');
		//inst.settings.tabs = inst.settings.tablist.find('[role="tab"]'); //document.querySelectorAll("#"+inst.settings.target.attr("id")+' [role="tablist"]')[0];
		//inst.settings.panels = inst.settings.tablist.find('.tab-content')//document.querySelectorAll("#"+inst.settings.target.attr("id")+' .tab-content')[0];
	},


  

  addListeners : function(index,inst) {
    inst.settings.tabs[index].addEventListener('click', (event)=> $.tabfocuser.clickEventListener(event,inst));
    inst.settings.tabs[index].addEventListener('keydown', (event)=> $.tabfocuser.keydownEventListener(event,inst));
    //inst.settings.tabs[index].addEventListener('keyup', $.tabfocuser.keyupEventListener ,inst);
	inst.settings.tabs[index].addEventListener('keyup', (event)=> $.tabfocuser.keyupEventListener(event,inst));
    // Build an array with all tabs (<button>s) in it
    inst.settings.tabs[index].index = index;
  },

  // When a tab is clicked, activateTab is fired to activate it
  clickEventListener : function(event,inst) {
    var tab = event.target;
    $.tabfocuser.activateTab(tab, inst, false);
  },

  // Handle keydown on tabs
  keydownEventListener : function(event,inst) {
    var key = event.keyCode;

    switch (key) {
      case inst.settings.keys.end:
        event.preventDefault();
        // Activate last tab
        $.tabfocuser.activateTab(inst.settings.tabs[inst.settings.tabs.length - 1],inst);
        break;
      case inst.settings.keys.home:
        event.preventDefault();
        // Activate first tab
        $.tabfocuser.activateTab(inst.settings.tabs[0],inst);
        break;

      // Up and down are in keydown
      // because we need to prevent page scroll >:)
      case inst.settings.keys.up:
      case inst.settings.keys.down:
        $.tabfocuser.determineOrientation(event,inst);
        break;
    };
  },

  // Handle keyup on tabs
  keyupEventListener : function(event,inst) {
    var key = event.keyCode;

    switch (key) {
      case inst.settings.keys.left:
      case inst.settings.keys.right:
        $.tabfocuser.determineOrientation(event,inst);
        break;
      case inst.settings.keys.delete:
        $.tabfocuser.determineDeletable(event,inst);
        break;
    };
  },

  // When a tablist’s aria-orientation is set to vertical,
  // only up and down arrow should function.
  // In all other cases only left and right arrow function.
  determineOrientation : function(event,inst) {
    var key = event.keyCode;
    var vertical = inst.settings.tablist.getAttribute('aria-orientation') == 'vertical';
    var proceed = false;

    if (vertical) {
      if (key === inst.settings.keys.up || key === inst.settings.keys.down) {
        event.preventDefault();
        proceed = true;
      };
    }
    else {
      if (key === inst.settings.keys.left || key === inst.settings.keys.right) {
        proceed = true;
      };
    };

    if (proceed) {
      $.tabfocuser.switchTabOnArrowPress(event,inst);
    };
  },

  // Either focus the next, previous, first, or last tab
  // depening on key pressed
  switchTabOnArrowPress : function(event,inst) {
    var pressed = event.keyCode;
    for (x = 0; x < inst.settings.tabs.length; x++) {
      inst.settings.tabs[x].addEventListener('focus', (event)=> $.tabfocuser.focusEventHandler(event,inst));
    };

    if (inst.settings.direction[pressed]) {
      var target = event.target;
      if (target.index !== undefined) {
        if (inst.settings.tabs[target.index + inst.settings.direction[pressed]]) {
          inst.settings.tabs[target.index + inst.settings.direction[pressed]].focus();
        }
        else if (pressed === inst.settings.keys.left || pressed === inst.settings.keys.up) {
          $.tabfocuser.focusLastTab(inst);
        }
        else if (pressed === inst.settings.keys.right || pressed == inst.settings.keys.down) {
          $.tabfocuser.focusFirstTab(inst);
        };
      };
    };
  },

  // Activates any given tab panel
  activateTab : function(tab, inst, setFocus) {
    setFocus = setFocus || true;
    // Deactivate all other tabs
    $.tabfocuser.deactivateTabs(inst);

    // Remove tabindex attribute
    tab.removeAttribute('tabindex');

    // Set the tab as selected
    tab.setAttribute('data-selected', 'true');
	tab.setAttribute('title', '선택됨');

    // Get the value of data-controls (which is an ID)
    var controls = tab.getAttribute('data-controls');

    // Remove hidden attribute from tab panel to make it visible
    //inst.settings.target.getElementById(controls).removeAttribute('hidden');
	inst.settings.target.find("#"+controls).removeAttr("hidden");
    // Set focus when required
    if (setFocus) {
      tab.focus();
    };
  },

  // Deactivate all tabs and tab panels
  deactivateTabs : function(inst) {
    for (t = 0; t < inst.settings.tabs.length; t++) {
      inst.settings.tabs[t].setAttribute('tabindex', '-1');
      inst.settings.tabs[t].setAttribute('data-selected', 'false');
	  inst.settings.tabs[t].setAttribute('title', '선택안됨');
      inst.settings.tabs[t].removeEventListener('focus', (event)=> $.tabfocuser.focusEventHandler(event,inst));
    };

    for (p = 0; p < inst.settings.panels.length; p++) {
      inst.settings.panels[p].setAttribute('hidden', 'hidden');
    };
  },

  // Make a guess
  focusFirstTab : function(inst) {
    inst.settings.tabs[0].focus();
  },

  // Make a guess
  focusLastTab : function(inst) {
    inst.settings.tabs[inst.settings.tabs.length - 1].focus();
  },

  // Detect if a tab is deletable
  determineDeletable : function(event,inst) {
    target = event.target;

    if (target.getAttribute('data-deletable') !== null) {
      // Delete target tab
      $.tabfocuser.deleteTab(event, inst);

      // Update arrays related to tabs widget
      $.tabfocuser.generateArrays(inst);

      // Activate the closest tab to the one that was just deleted
      if (target.index - 1 < 0) {
        $.tabfocuser.activateTab(inst.settings.tabs[0],inst);
      }
      else {
        $.tabfocuser.activateTab(inst.settings.tabs[target.index - 1],inst);
      };
    };
  },

  // Deletes a tab and its panel
  deleteTab : function(event,inst) {
    var target = event.target;
    var panel = document.getElementById(target.getAttribute('data-controls'));
    target.parentElement.removeChild(target);
    panel.parentElement.removeChild(panel);
  },

  // Determine whether there should be a delay
  // when user navigates with the arrow keys
  determineDelay : function() {
    var hasDelay = inst.settings.tablist.hasAttribute('data-delay');
    var delay = 0;

    if (hasDelay) {
      var delayValue = inst.settings.tablist.getAttribute('data-delay');
      if (delayValue) {
        delay = delayValue;
      }
      else {
        // If no value is specified, default to 300ms
        delay = 300;
      };
    };

    return delay;
  },

  //
  focusEventHandler : function(event,inst) {
    var target = event.target;

   // setTimeout($.tabfocuser.checkTabFocus, inst.settings.delay, target);
  },

  // Only activate tab on focus if it still has focus after the delay
  checkTabFocus : function(target) {
    focused = document.activeElement;

    if (target === focused) {
      $.tabfocuser.activateTab(target, inst, false);
    };
  }

});



$.fn.tabfocuser = function(options){
	$.tabfocuser._SetConfig(this, options);
}
$.tabfocuser = new Tabfocuser(); // singleton instance

var tabfocuser = $.tabfocuser;