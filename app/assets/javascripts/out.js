
$(document).ready(function () {
    var basepath = '/api/v1/users/';
    var clientId = "56752ab8-9388-4d1a-99e2-17ae3e1e7419";

    if (document.location.hostname == 'test.gridle.io' || document.location.hostname == 'demo.gridle.io' || document.location.hostname == 'demo.ionth.com') {
        clientId = "5673edd7-5528-4424-a618-6ebe3e1e7419";
    }

    if (document.location.hostname == 'gridle.io') {
        clientId = "5673ec91-6644-4630-83d1-6ebd3e1e7419";
    }

    function isValidEmailAddress(emailAddress) {
        var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
        return pattern.test(emailAddress);
    }
    ;

    $.ajaxSetup({
        beforeSend: function (xhr)
        {
            xhr.setRequestHeader("Accept", "application/json");
            xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
            xhr.setRequestHeader("Client-Id", clientId);
        }
    });

    $("#forgotPasswordButton").bind("click", function () {
        forgotPassword();
    });

    $("#loginButton").bind("click", function () {
        login();
    });


    $("#loginForm").keypress(function (event) {
        if (event.which == 13) {
            event.preventDefault();
            login();
        }
    });
    
    $("#forgotPassWordForm").keypress(function (event) {
        if (event.which == 13) {
            event.preventDefault();
            forgotPassword();
        }
    });
    
    $("#resetPassWordForm").keypress(function (event) {
        if (event.which == 13) {
            event.preventDefault();
            resetPassword();
        }
    });

    $("#signupForm").keypress(function (event) {
        if (event.which == 13) {
            event.preventDefault();
            signup();
        }
    });

    function login() {
        var email = $("#email").val();
        var password = $("#password").val();
        var remember = $("#remember").prop("checked");
        // Checking for blank fields.
        if (email == '' || password == '') {
            //some validation error
        } else if (!isValidEmailAddress(email)) {
            return false;
        } else {
            var data = {};
            data.User = {};
            data.User.email = email;
            data.User.type = 'gridle';
            data.User.password = password;
            if (remember) {
                data.User.remember_me = 1;
            }
            data.User.grant_type = 'password';
            var url = basepath + "login";
            $.ajax({
                url: url,
                method: 'POST',
                data: data,
                success: function (data) {
                    save_localStorage(data);
                    window.location = "/index.html";
                },
                error: function (data) {
                    console.log('an error');
                }
            });
        }
    }

    function signup() {
        var email = $("#email").val();
        var password = $("#password").val();
        var first_name = $("#first_name").val();
        var last_name = $("#last_name").val();

        // Checking for blank fields.
        if (email == '' || password == '' || first_name == '' || last_name == '') {
            //some validation error
            console.log('empty');
        } else if (first_name.length <= 2 || first_name.length <= 2) {
            console.log('name length');
            return false;
        } else if (password.length <= 5) {
            console.log('pwd length');
            return false;
        } else if (!isValidEmailAddress(email)) {
            console.log('email locha');
            return false;
        } else {
            var data = {};
            data.User = {};
            data.User.email = email;
            data.User.type = 'gridle';
            data.User.password = password;
            data.User.first_name = first_name;
            data.User.last_name = last_name;
            var url = basepath + "add";
            $.ajax({
                url: url,
                method: 'POST',
                data: data,
                success: function (data) {
                    save_localStorage(data);
                    window.location = "/index.html";
                },
                error: function (data) {
                    console.log('an error');
                }
            });
        }
    }
    
    function forgotPassword(){
        var email = $("#email").val();
        if (!isValidEmailAddress(email)) {
            console.log('email locha');
            return false;
        }
        var data = {};
            data.User = {};
            data.User.email = email;
            var url = basepath + "forgotPassword";
            $.ajax({
                url: url,
                method: 'POST',
                data: data,
                success: function (data) {
                    save_localStorage(data);
                    window.location = "/index.html";
                },
                error: function (data) {
                    console.log('an error');
                }
            });
    }
    
    function resetPassword(){
        var password = $("#password").val();
        var passwordConfirm = $("#passwordConfirm").val();
        
        if(password != passwordConfirm){
            return false;
        }
        
        var token = '';
        var data = {};
            data.User = {};
            data.User.new_password = password;
            var url = basepath + "forgotPassword/"+token;
            
            $.ajax({
                url: url,
                method: 'POST',
                data: data,
                success: function (data) {
                    window.location = "/login.html";
                },
                error: function (data) {
                    console.log('an error');
                }
            });
    }

    function google_oauth(id_token) {

        if (id_token == '') {
            //some validation error
        } else {
            var data = {};
            data.User = {};
            data.User.type = 'google';
            data.User.id_token = id_token;
            var url = basepath + "oauth";
            $.ajax({
                url: url,
                method: 'POST',
                data: data,
                success: function (data) {
                    save_localStorage(data);
                    window.location = "/index.html";
                },
                error: function (data) {
                    console.log('an error');
                }
            });
        }
    }

    function save_localStorage(data) {
        localStorage.setItem('gridle_auth_token', data.data.access_token);
        var date = new Date();
        data.expires_in = date.setDate(date.getDate() + 1);
        localStorage.setItem('gridle_expires_at', data.expires_in);
        var user_data = JSON.stringify(data.data.User);
        localStorage.setItem('gridle_user', user_data);
        localStorage.setItem('gridle_workspace_id', data.data.workspace_id);
    }

    function startApp() {
        gapi.load('auth2', function () {
            // Retrieve the singleton for the GoogleAuth library and set up the client. 
            auth2 = gapi.auth2.init({
                client_id: '715317634063-48ob0oicirgndvp4d3fh7c0ao0fgnt8c.apps.googleusercontent.com',
                cookiepolicy: 'single_host_origin',
                approvalprompt: 'auto',
                scope: 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read https://www.googleapis.com/auth/plus.circles.read https://www.googleapis.com/auth/userinfo.email'
            });
            attachSignin(document.getElementById('googleSignin'));
        });
    }
    ;

    function attachSignin(element) {
        auth2.attachClickHandler(element, {},
                function (googleUser) {
                    //var profile = googleUser.getBasicProfile(); 
                    var id_token = googleUser.getAuthResponse().id_token;
                    google_oauth(id_token);
                }, function (error) {
            console.log(JSON.stringify(error, undefined, 2));
        });
    }

    onLoadCallback = function () {
        startApp();
    };

    if (document.location.hostname == 'localhost') {
        (function () {
            var po = document.createElement('script');
            po.type = 'text/javascript';
            po.src = '//localhost:35729/livereload.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(po, s);
        })();
    }

    new WOW().init();

    $(window).scroll(function () {
        var dataSrc = $(".navbar .logo").attr("data-src");
        var dataCollapsedSrc = $(".navbar .logo").attr("data-collapsed-src");

        var wScroll = $(this).scrollTop();
        if (wScroll > 300) {
            $('.main-header .navbar').addClass('collapsed');
            $(".navbar .logo").attr("src", dataCollapsedSrc);
        } else {
            $('.main-header .navbar').removeClass('collapsed');
            $(".navbar .logo").attr("src", dataSrc);
        }
    });
});
