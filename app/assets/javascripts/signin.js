var LoginModalController = {
    tabsElementName: ".logmod__tabs li",
    tabElementName: ".logmod__tab",
    inputElementsName: ".logmod__form .input",
    hidePasswordName: ".hide-password",
    
    inputElements: null,
    tabsElement: null,
    tabElement: null,
    hidePassword: null,
    
    activeTab: null,
    tabSelection: 0, // 0 - first, 1 - second
    
    findElements: function () {
        var base = this;
        
        base.tabsElement = $(base.tabsElementName);
        base.tabElement = $(base.tabElementName);
        base.inputElements = $(base.inputElementsName);
        base.hidePassword = $(base.hidePasswordName);
        
        return base;
    },
    
    setState: function (state) {
    	var base = this,
            elem = null;
        
        if (!state) {
            state = 0;
        }
        
        if (base.tabsElement) {
        	elem = $(base.tabsElement[state]);
            elem.addClass("current");
            $("." + elem.attr("data-tabtar")).addClass("show");
        }
  
        return base;
    },
    
    getActiveTab: function () {
        var base = this;
        
        base.tabsElement.each(function (i, el) {
           if ($(el).hasClass("current")) {
               base.activeTab = $(el);
           }
        });
        
        return base;
    },
   
    addClickEvents: function () {
    	var base = this;
        
        base.hidePassword.on("click", function (e) {
            var $this = $(this),
                $pwInput = $this.prev("input");
            
            if ($pwInput.attr("type") == "password") {
                $pwInput.attr("type", "text");
                $this.text("Hide");
            } else {
                $pwInput.attr("type", "password");
                $this.text("Show");
            }
        });
 
        base.tabsElement.on("click", function (e) {
            var targetTab = $(this).attr("data-tabtar");
            
            e.preventDefault();
            base.activeTab.removeClass("current");
            base.activeTab = $(this);
            base.activeTab.addClass("current");
            
            base.tabElement.each(function (i, el) {
                el = $(el);
                el.removeClass("show");
                if (el.hasClass(targetTab)) {
                    el.addClass("show");
                }
            });
        });
        
        base.inputElements.find("label").on("click", function (e) {
           var $this = $(this),
               $input = $this.next("input");
            
            $input.focus();
        });
        
        return base;
    },
    
    initialize: function () {
        var base = this;
        
        base.findElements().setState().getActiveTab().addClickEvents();
    },

    login: function(){
        var password = $('#user-password').val().trim();
        var email = $('#user-email-sign-in').val().trim();
        console.log("muskaraye ap login mein hai", password, email);
        $.ajax({
          type: "POST",
          url: "http://localhost:3000/users/sign_in",
          data: { user: { email: email, password: password}},
          success: function(data){
            console.log(data);
            // save auth token in local storage
            if (window.sessionStorage) {
                sessionStorage.setItem("auth_token", data.auth_token);
                sessionStorage.setItem("email", data.email);
                window.location = "/dashboard"
            }
          },
          dataType: 'json'
        });
    },

    signup: function(){
        var password = $('#user-password-sign-up').val().trim();
        var password_confirmation = $('#user-email-sign-up-confirm').val().trim();
        var email = $('#user-email-sign-up').val().trim();
        $.ajax({
          type: "POST",
          url: api_url+"/users",
          data: { user: { email: email, password: password, password_confirmation: password_confirmation}},
          success: function(data){
            console.log(data);
            // save auth token in local storage
            if (window.sessionStorage) {
                sessionStorage.setItem("auth_token", data.auth_token);
                sessionStorage.setItem("email", data.email);
                window.location = "/dashboard"
            }
          },
          dataType: 'json'
        });
    }
};

$(document).ready(function() {
    LoginModalController.initialize();
    console.log(api_url)
    $("#input-login").on('click', function(e){       
        LoginModalController.login();
    });
});