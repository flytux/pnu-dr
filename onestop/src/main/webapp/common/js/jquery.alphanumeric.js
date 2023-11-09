(function($){
	
	var supportIMEMode = ('ime-mode' in document.body.style);
	
	$.fn.alphanumeric = function(p) { 

		p = $.extend({
			ichars: "!@#$%^&*()+=[]\\\';,/{}|\":<>?~`.-_ ",
			nchars: "",
			allow: ""
		  }, p);	

		return this.each
			(
				function() 
				{
					$(this).css('ime-mode', 'disabled');

					if (p.nocaps) p.nchars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
					if (p.allcaps) p.nchars += "abcdefghijklmnopqrstuvwxyz";
					
					s = p.allow.split('');
					for ( i=0;i<s.length;i++) if (p.ichars.indexOf(s[i]) != -1) s[i] = "\\" + s[i];
					p.allow = s.join('|');
					
					var reg = new RegExp(p.allow,'gi');
					var ch = p.ichars + p.nchars;
					ch = ch.replace(reg,'');

					$(this).keypress
						(
							function (e)
								{
									if (!e.charCode) k = String.fromCharCode(e.which);
										else k = String.fromCharCode(e.charCode);
										
									if (ch.indexOf(k) != -1) e.preventDefault();
									if (e.ctrlKey&&k=='v') e.preventDefault();
									
								}
								
						);
						
					$(this).bind('contextmenu',function () {return false});
					
					if (!supportIMEMode) {
						$(this)
						.bind('keydown blur', function(e) {
							var target = $(this);
					        window.setTimeout( function() {
					            var v = target.val();
					            target.val( filterMBC(v) );
					        }, 1);
						})
						.bind('paste', function() {
					        var target = jQuery(this);
					        window.setTimeout( function() {
					            var v = target.val();
					            target.val( filterMBC(v) );
		
					        }, 1);
					    })
					    ;
					}
				}
			);

	};
	
	function filterMBC(src){
        var str = '';
        src = escape(src); 
        for(i = 0; i < src.length; i++){
            var chr = src.charAt(i);
            if(chr == '%'){
                var nchr = src.charAt(++i);
                if(nchr == 'u'){
                    i += 4;
                } else {
                    str += chr
                    str += nchr
                    str += src.charAt(++i);
                }
                continue;
            }

            str += chr;
        }
        return unescape(str);
    }

	$.fn.numeric = function(p) {
	
		var az = "abcdefghijklmnopqrstuvwxyz";
		az += az.toUpperCase();

		p = $.extend({
			nchars: az
		  }, p);	
		  	
		return this.each (function()
			{
				$(this).css('ime-mode', 'disabled');
				$(this).alphanumeric(p);
			}
		);
			
	};
	
	$.fn.alpha = function(p) {

		var nm = "1234567890";

		p = $.extend({
			nchars: nm
		  }, p);	

		return this.each (function()
			{
				$(this).css('ime-mode', 'disabled');
				$(this).alphanumeric(p);
			}
		);
			
	};	

})(jQuery);
