<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />
<#import "/spring.ftl" as spring/>
<#import "pattern.ftlh" as pt/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Вход</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="preload" as="style" href="css/critical.css">
    <link rel="stylesheet" href="css/critical.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/nicepage.css" media="screen">
    <script class="u-script" type="text/javascript" src="js/jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="js/nicepage.js" defer=""></script>
</head>

<body>

<@pt.header menu="n"/>

<div class="flex-row center-xs">
    <div class="col-xs-12 col-md-11">
        <div class="box-container">
            <div id="ember327" class="sign-form__body login-form__body ember-view">
                <form style="max-width:350px;align-content: flex-start;flex-flow: wrap;display: inline-flex;justify-content: center;"
                    method="POST" action="/course/login" id="login_form" autocomplete="on">
                    <div class="sign-form__input-group">
                    <p><strong><span style="font-family: arial, helvetica, sans-serif; font-size: 14pt;">Вход</span></strong></p>
                        <label class="sign-form__hidden-label" for="id_login_email">Логин</label>
                        <input name="username" autocomplete="email" spellcheck="false" required="" placeholder="Логин" id="id_login_email" class="ember-text-field ember-view sign-form__input" type="text">

                        <label class="sign-form__hidden-label" for="id_login_password">Пароль</label>
                        <input name="password" autocomplete="password" required="" placeholder="Пароль" id="id_login_password" class="ember-text-field ember-view sign-form__input" type="password">
                    </div>

                    <button class="sign-form__btn button_with-loader" type="submit" style="max-width: 210px;min-height: 40px;">
                                            Вход
                                        </button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>