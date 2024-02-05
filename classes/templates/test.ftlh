<#import "pattern.ftlh" as pt/>

<html class="no-js flexbox-gap" lang="ru" data-whatinput="mouse" data-whatintent="mouse"><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Вставь название страницы -->
    <title>Главная</title>
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
<body class="ember-application" data-route="step.index"
      style="--computed-header-height:50px; --no-initial-animate-duration: initial;" data-socks-connected="">

<@pt.header menu="y"/>

<main class="main-content" onchange="showDiv(this)">
    <div data-step-type="text" id="ember1418" class="lesson-modern__main lesson-wrapper in-course ember-view">
        <div class="lesson-modern__body">

            <@pt.sidebar/>

            <div class="lesson-modern__wrapper">
                <div id="ember1444" class="lesson-modern__top-panel ember-view">
                    <div class="top-tools page-fragment">
                        <div class="top-tools__lesson-name">
                            <!-- Название теста -->
                            ${testName}
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
                                                    <#if testStart>
                                                    <#if !testEnd>
                                                    <div class="step-wrapper">
                                                        <div class="step-inner page-fragment">
                                                            <div id="ember2538" class="html-content rich-text-viewer ember-view" data-processed="">
                                                                <span>
                                                                    ${question.question?no_esc}
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="attempt__message">

                                                    <#if request??>
                                                    <#if request>
                                                    <span class="attempt-message_correct">
                                                    <span id="ember1731" class="svg-icon correct_icon ember-view attempt-wrapper__result-icon">
                                                    <img class="navbar__profile-img" src="/course/images/accept.png">
                                                    </span>
                                                    Верно!
                                                    </span>
                                                    <#else>
                                                    <span class="attempt-message_wrong">
                                                    <span id="ember1723" class="svg-icon wrong_icon ember-view attempt-wrapper__result-icon">
                                                    <img class="navbar__profile-img" src="/course/images/remove.png">
                                                    </span>
                                                    Неверно. Попробуете еще раз?
                                                    </span>
                                                    </#if>
                                                    </#if>

                                                    </div>

                                                    <section class="attempt-wrapper__body">
                                                        <div class="page-fragment">
                                                            <div class="attempt__inner">
                                                                <div id="code-run__notify" class="attempt__code-run-notify" hidden=""></div>
                                                                <form action="/course/test/send" method="GET">
                                                                <div class="attempt">
                                                                    <div id="ember2549" class="quiz-plugin ember-view">
                                                                        <div class="show-plugin">
                                                                            <div data-state="no_submission" data-type="choice-quiz" id="ember2550"
                                                                                 class="quiz-component ember-view">

                                                                                <#list 1..answerCount as i>
                                                                                <label
                                                                                    <#if multiAnswer>
                                                                                    class="s-checkbox"
                                                                                    <#else>
                                                                                    class="s-radio"
                                                                                    </#if>>
                                                                                    <#if multiAnswer>
                                                                                        <input class="s-checkbox__input" name="check" type="checkbox" value="${i}">
                                                                                        <span class="s-checkbox__border">
                                                                                              <span class="s-checkbox__circle"></span>
                                                                                        </span>
                                                                                    <#else>
                                                                                        <input class="s-radio__input" name="radio" type="radio" value="${i}">
                                                                                        <span class="s-radio__border">
                                                                                            <span class="s-radio__circle"></span>
                                                                                        </span>
                                                                                    </#if>
                                                                                    <span class="choice-quiz-show__option s-radio__label">
                                                                                    <#if answerList??>
                                                                                        <#if answerList[i-1]??>
                                                                                        ${answerList[i-1].answer?no_esc}
                                                                                        </#if>
                                                                                    </#if>
                                                                                    </span>
                                                                                </label>
                                                                                </#list>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                    <#if request??>
                                                                        <#if !request>
                                                                <div class="attempt__actions">
                                                                    <button type="submit" class="u-btn u-btn-submit u-button-style">Отправить</button>
                                                                </div>
                                                                        </#if>
                                                                        <#else>
                                                                <div class="attempt__actions">
                                                                    <button type="submit" class="u-btn u-btn-submit u-button-style">Отправить</button>
                                                                </div>
                                                                    </#if>
                                                                </form>

                                                                <span>
                                                                    <#if request??>
                                                                        <#if request>
                                                                            <form action="/course/test/next" method="GET">
                                                                                <button type="submit" class="u-btn u-btn-submit u-button-style">Следующий</button>
                                                                            </form>
                                                                        </#if>
                                                                    </#if>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </section>
                                                    <#else>
                                                        <div class="step-wrapper">
                                                            <div class="step-inner page-fragment">
                                                                <div id="ember2538" class="html-content rich-text-viewer ember-view" data-processed="">
                                                                    <span>
                                                                        <p style="text-align: center;"><span style="font-size: 18pt; font-family: arial, helvetica, sans-serif;">Поздравляем!</span></p>
                                                                        <p style="text-align: center;"><span style="font-size: 14pt; font-family: arial, helvetica, sans-serif;">Вы прошли тестирование по разделу ${lessonName}, можете перейти к следующему разделу.</span></p>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </#if>
                                                    <#else>
                                                        <div class="u-align-left u-form-group u-form-submit">
                                                        <a href="/course/test/next">
                                                                <button class="u-btn u-btn-submit u-button-style">Начать</button>
                                                        </a>
                                                        </div>
                                                    </#if>
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