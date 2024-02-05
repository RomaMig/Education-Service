<!DOCTYPE html>
<#import "pattern.ftlh" as pt/>

<html class="no-js flexbox-gap" lang="ru" data-whatinput="mouse" data-whatintent="mouse"><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Вставь название страницы -->
    <title>Журнал</title>
    <link rel="preload" as="style" href="css/critical.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/critical.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/nicepage.css" media="screen">
    <script class="u-script" type="text/javascript" src="js/jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="js/nicepage.js" defer=""></script>
</head>
<body class="ember-application" data-route="step.index"
      style="--computed-header-height:50px; --no-initial-animate-duration: initial;" data-socks-connected="">

<@pt.header menu="y"/>

        <#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />
<main class="main-content" onchange="showDiv(this)">
    <div data-step-type="text" id="ember1418" class="lesson-modern__main lesson-wrapper in-course ember-view">
        <div class="lesson-modern__body">

            <@pt.sidebar/>

            <div class="lesson-modern__wrapper">
                <div id="ember1444" class="lesson-modern__top-panel ember-view">
                    <div class="top-tools page-fragment">
                        <div class="top-tools__lesson-name">

                        <@security.authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MODER')">
                <div class="u-form-group u-form-name">
            <form action="/course/journal" method="GET">
                    <label class="u-label">Имя пользователя</label>
                    <input type="text" placeholder="Введите логин" name="username" list="usernames"
                            <#if username??>value="${username}"</#if>
                           class="u-border-1 u-border-grey-30 u-input-courses u-input-rectangle u-white" required=""/>

                    <datalist id="usernames">
                        <#list userList as user>
                            <option value="${user}">
                        </#list>
                    </datalist>
                <div class="u-align-left u-form-group u-form-submit">
                    <button type="submit" class="u-btn u-btn-submit u-button-style">Загрузить</button>
                </div>
            </form>
                </div>

                        </@security.authorize>

                        <@security.authorize access="!hasAnyRole('ROLE_ADMIN','ROLE_MODER')">

                            <label class="u-label">Ваши данные</label>
                        </@security.authorize>
                        </div>
                    </div>
                </div>

                <div class="lesson lesson-modern">
                    <div class="lesson__player">
                        <div class="player-content-wrapper">
                            <article id="ember1465" class="step-show ember-view">
                                <div class="step-dynamic-container">
                                    <div id="ember1466" class="step-view step-view_material ember-view"><!---->
                                        <div class="step-wrapper">
                                            <div class="step-inner page-fragment">
                                                <div id="ember1467" class="html-content rich-text-viewer ember-view"
                                                     data-processed="">
                                                    <span>
                                        <table class="table">
                                            <tr>
                                                <th colspan="2">Список вопросов и ответов выбранных пользователем</th>
                                            </tr>
                                            <#if questionList??>
                                            <#list 1..questionCount as indexQuestion>
                                                <tr>
                                                    <td colspan="2">${questionList[indexQuestion - 1].question?no_esc}</td>
                                                </tr>
                                                <#if answerList??>
                                                <#list 1..answerCount[indexQuestion - 1] as indexAnswer>
                                                <#if answerList[answerOffset[indexQuestion - 1] + indexAnswer - 1]??>
                                                    <#if answerList[answerOffset[indexQuestion - 1] + indexAnswer - 1].isChosen()>
                                                    <tr>
                                                        <td>
                                                            <#if answerList[answerOffset[indexQuestion - 1] + indexAnswer - 1].isTruth()>
                                                            Верный
                                                            <#else>
                                                            Неверный
                                                            </#if>
                                                        </td>
                                                        <td>${answerList[answerOffset[indexQuestion - 1] + indexAnswer - 1].answer?no_esc}</td>
                                                    </tr>
                                                    </#if>
                                                </#if>
                                                </#list>
                                                </#if>
                                                    <th colspan="2">
                                                        <div class="u-align-left u-form-group u-form-submit">

                                                        </div>
                                                    </th>
                                            </#list>
                                            </#if>
                                         </table>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                    <hr class="modern-lesson-divider">
                </div>
            </div>
        </div>
    </div>
</main>
</body>

<@pt.auth/>

<style>
.u-dialog-section-4 {
  min-height: 826px;
}

.u-dialog-section-4 .u-dialog-1 {
  width: 566px;
  min-height: 346px;
  margin: 60px auto;
}

.u-dialog-section-4 .u-container-layout-1 {
  padding: 40px 30px;
}

.u-dialog-section-4 .u-form-1 {
  height: 257px;
  width: 400px;
  margin: 0 auto;
}

.u-dialog-section-4 .u-form-group-1 {
  width: 100%;
}

.u-dialog-section-4 .u-label-1 {
  font-size: 1rem;
}

.u-dialog-section-4 .u-form-group-2 {
  width: 100%;
}

.u-dialog-section-4 .u-label-2 {
  font-size: 1rem;
}

.u-dialog-section-4 .u-form-group-3 {
  width: 100%;
}

.u-dialog-section-4 .u-btn-1 {
  padding-left: 60px;
  padding-right: 60px;
  background-image: none;
  border-style: none;
  text-transform: none;
  width: 100%;
}

.u-dialog-section-4 .u-icon-1 {
  width: 15px;
  height: 15px;
  left: auto;
  top: 17px;
  position: absolute;
  right: 16px;
}

@media (max-width: 1199px) {
  .u-dialog-section-4 .u-dialog-1 {
    height: auto;
  }
}

@media (max-width: 991px) {
  .u-dialog-section-4 .u-container-layout-1 {
    padding-bottom: 30px;
  }
}

@media (max-width: 767px) {
  .u-dialog-section-4 .u-dialog-1 {
    width: 540px;
  }

  .u-dialog-section-4 .u-container-layout-1 {
    padding-top: 30px;
    padding-left: 40px;
    padding-right: 40px;
  }
}

@media (max-width: 575px) {
  .u-dialog-section-4 .u-dialog-1 {
    width: 340px;
  }

  .u-dialog-section-4 .u-container-layout-1 {
    padding-top: 40px;
    padding-left: 25px;
    padding-right: 25px;
  }

  .u-dialog-section-4 .u-form-1 {
    height: 152px;
    margin-top: 93px;
    margin-right: initial;
    margin-left: initial;
    width: auto;
  }
}

</style>