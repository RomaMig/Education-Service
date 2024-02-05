<#import "pattern.ftlh" as pt/>

<!DOCTYPE html>
<html style="font-size: 16px;">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Вставь название страницы -->
    <title>Добавить тест</title>
    <link rel="stylesheet" href="css/critical.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/nicepage.css" media="screen">
    <link rel="stylesheet" href="css/add_course.css" media="screen">
    <link rel="stylesheet" href="css/style.css" media="screen">
    <script class="u-script" type="text/javascript" src="js/jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="js/nicepage.js" defer=""></script>
    <script src="https://cdn.tiny.cloud/1/qagffr3pkuv17a8on1afax661irst1hbr4e6tbv888sz91jc/tinymce/5-stable/tinymce.min.js"
            referrerpolicy="origin"></script>
    <script type="text/javascript" src="js/tinyaverage-init.js"></script>
    <script type="text/javascript" src="js/tinymini-init.js"></script>
</head>
<body class="u-body u-xl-mode ember-application" data-route="step.index"
      style="--computed-header-height:50px; --no-initial-animate-duration: initial;" data-socks-connected="">

<@pt.header menu="n"/>

<main class="main-content" onchange="showDiv(this)">
    <div data-step-type="text" id="ember1418" class="lesson-modern__main lesson-wrapper in-course ember-view">
        <div class="lesson-modern__body">


            <div data-pinned="" id="ember1432"
                             class="lesson-sidebar ember-view player-lesson-sidebar player__lesson-sidebar">
                            <div class="lesson-sidebar__wrapper">
                                <div class="lesson-sidebar__body">
                                    <div class="lesson-sidebar__header">
                                        <a title="Главная" href="/course/home" id="ember1434" class="ref-color ember-view lesson-sidebar__course-title">
                                            Главная
                                        </a>
                                    </div>
                                    <!-- Организуй список -->
                                    <div class="lesson-sidebar__content custom-scrollbar custom-scrollbar_dark">
                                    <#list 1..lessonCount as indexLesson>
                                        <nav id="ember1438" class="toc-sections ember-view lesson-sidebar__toc"
                                             aria-label="Навигация по курсу">

                                            <div class="lesson-sidebar__module-header lesson-my_sidebar_wrapper" data-section="117111"
                                                 role="directory" aria-expanded="false">

                                                     <div id="ember2161"
                                                        class="ember-view lesson-sidebar__lesson header-font">
                                                        <div class="sidebar-module-header__title">
                                                            ${lessonList[indexLesson - 1].name}
                                                        </div>
                                                     </div>
                                            </div>
                                            <div class="lesson-sidebar__toc-inner" data-section="117111">

                                                <div data-unit="291938" id="ember1515"
                                                     class="with-lazy-loading toc-lesson ember-view">
                                                    <div>
                                                        <a href="${'/course/add_test/'+lessonList[indexLesson - 1].id}" id="ember2162"
                                                           class="ref-color ember-view lesson-sidebar__lesson">
                                                            <span class="lesson-sidebar__lesson-name">
                                                            <#if lessonList[indexLesson - 1].name != "Аттестация">
                                                                Тест по разделу ${lessonList[indexLesson - 1].name}
                                                            <#else>
                                                                Аттестация
                                                            </#if>
                                                            </span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </nav>
                                    </#list>
                                    </div>
                                </div>
                            </div>
                        </div>

            <div class="lesson-modern__wrapper">
                <div id="ember1444" class="lesson-modern__top-panel ember-view">
                    <div class="top-tools page-fragment">
                        <div class="top-tools__lesson-name">
                            <!-- Название статьи -->
                            ${lessonName}
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

<section class="u-clearfix u-section-1" id="sec-62bd">
    <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-expanded-width u-form u-form-1">
            <form action="/course/add_test" method="POST"
                  class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form" source="custom" name="form"
                  style="padding: 10px;">

                <div class="u-form-group u-form-name">
                    <body>
                    <textarea id="question" name="questionText"><#if questionText??>${questionText}</#if></textarea>
                    </body>
                </div>
                <div class="u-form-group u-form-name">
                    <body>
                    <table>
                        <#list 1..5 as i>
                        <tr>
                            <td class="outer">
                                    <input type="checkbox" name="${'answerCheck'+i}"
                                        class="custom-checkbox about"

                                        <#if answerTextList??>
                                            <#if answerTextList[i - 1]??>
                                                <#if answerTextList[i - 1].isTruth()>
                                                    checked
                                                </#if>
                                            </#if>
                                        </#if>>
                                    <label class="about">Верный</label>
                            </td>
                            <td class="inner">
                                <textarea id="${'answer'+i}" name="${'answerText'+i}">
                                    <#if answerTextList??>
                                        <#if answerTextList[i - 1]??>
                                            ${answerTextList[i - 1].answer}
                                        </#if>
                                    </#if>
                                </textarea>
                            </td>
                        </tr>
                        </#list>
                    </table>
                    </body>
                </div>
                <div class="u-align-left u-form-group u-form-submit">
                    <input type="hidden" name="action" value="save"/>
                    <button type="submit" class="u-btn u-btn-submit u-button-style">Сохранить</button>
                </div>
            </form>
        </div>
    </div>
</section>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                    <hr class="modern-lesson-divider">
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
                                                <th colspan="2">Список вопросов и ответов</th>
                                            </tr>
                                            <#if questionList??>
                                            <#list 1..questionCount as indexQuestion>
                                                <tr>
                                                    <td colspan="2">${questionList[indexQuestion - 1].question?no_esc}</td>
                                                </tr>
                                                <#if answerList??>
                                                <#list 1..answerCount[indexQuestion - 1] as indexAnswer>
                                                <#if answerList[answerOffset[indexQuestion - 1] + indexAnswer - 1]??>
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
                                                </#list>
                                                </#if>
                                                    <th colspan="2">
                                                        <div class="u-align-left u-form-group u-form-submit">
                                                    <form action="/course/add_test" method="GET" class="form-table">
                                                            <input type="hidden" name="questionId" value="${questionList[indexQuestion - 1].id}"/>
                                                            <input type="hidden" name="action" value="change"/>
                                                            <button type="submit" class="u-btn u-btn-submit u-button-style">Изменить</button>
                                                    </form>
                                                    <form action="/course/add_test" method="GET" class="form-table">
                                                            <input type="hidden" name="questionId" value="${questionList[indexQuestion - 1].id}"/>
                                                            <input type="hidden" name="action" value="delete"/>
                                                            <button type="submit" class="u-btn u-btn-submit u-button-style">Удалить</button>
                                                    </form>
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
                </div>
            </div>
        </div>
    </div>
</main>
</body>




<style> .u-dialog-section-4 {
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
</body>
</html>