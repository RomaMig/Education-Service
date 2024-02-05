<#import "pattern.ftlh" as pt/>

<!DOCTYPE html>
<html style="font-size: 16px;">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Вставь название страницы -->
    <title>Добавить статью</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/critical.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/nicepage.css" media="screen">
    <link rel="stylesheet" href="css/add_course.css" media="screen">
    <link rel="stylesheet" href="css/style.css" media="screen">
    <script class="u-script" type="text/javascript" src="js/jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="js/nicepage.js" defer=""></script>
    <script src="https://cdn.tiny.cloud/1/qagffr3pkuv17a8on1afax661irst1hbr4e6tbv888sz91jc/tinymce/5-stable/tinymce.min.js"
            referrerpolicy="origin"></script>
    <script type="text/javascript" src="js/tiny-init.js"></script>
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
                                                <#if lessonList[indexLesson - 1].name != "Аттестация">
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
                                                <#list 1..articleCount[indexLesson - 1] as indexArticle>
                                                <div data-unit="291937" id="ember1513"
                                                     class="with-lazy-loading toc-lesson ember-view">
                                                    <div>
                                                        <a href="/course/add_course/${articleList[articleOffset[indexLesson - 1] + indexArticle - 1].id}" id="ember2161"
                                                           class="ref-color ember-view lesson-sidebar__lesson">
                                                            <span class="lesson-sidebar__lesson-name">${articleList[articleOffset[indexLesson - 1] + indexArticle - 1].name}</span>
                                                            <div class="u-align-left u-form-group u-form-submit">

                                                    <form action="/course/add_course" method="POST">
                                                                <input type="hidden" name="article_id" value="${articleList[articleOffset[indexLesson - 1] + indexArticle - 1].id}"/>
                                                                <input type="hidden" name="action" value="delete_article"/>
                                                                <button type="submit" class="btn-trash u-btn-submit">
                                                                    <img src="/course/images/delete.png">
                                                                </button>
                                                    </form>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                                </#list>
                                            </div>
                                        </nav>
                                                </#if>
                                    </#list>
                                    </div>
                                </div>
                            </div>
                        </div>


            <div class="lesson-modern__wrapper">

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
            <form action="/course/add_course" method="POST"
                  class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form" source="custom" name="form"
                  style="padding: 10px;">


                <div class="u-form-group u-form-name">
                    <label class="u-label">Название раздела</label>
                    <input type="text" placeholder="Введите название раздела" name="lessonName" list="lessons"
                            value="${currentLessonName}"
                           class="u-border-1 u-border-grey-30 u-input-courses u-input-rectangle u-white" required=""/>

                    <datalist id="lessons">
                        <#list lessonList as lesson>
                            <option value="${lesson.name}">
                        </#list>
                    </datalist>
                </div>

                <div class="u-form-group u-form-name">
                    <label class="u-label">Название статьи</label>
                    <input type="text" placeholder="Введите название статьи" name="articleName" list="articles"
                            value="${currentArticleName}"
                           class="u-border-1 u-border-grey-30 u-input-courses u-input-rectangle u-white" required=""/>

                    <datalist id="articles">
                        <#list articleListSelect as article>
                            <option value="${article.name}">
                        </#list>
                    </datalist>
                </div>


                <div class="u-form-group u-form-name">
                    <body>
                    <textarea id="textarea" name="articleText">${articleText}</textarea>
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