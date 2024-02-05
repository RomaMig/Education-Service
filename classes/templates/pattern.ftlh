<#macro sidebar>
<style>
@media (max-width:990px) {
   .need-hide{
       display:none;
   }
}
</style>

<div data-pinned="" id="ember1432"
                 class="need-hide lesson-sidebar ember-view player-lesson-sidebar player__lesson-sidebar">
                <div class="lesson-sidebar__wrapper">
                    <div class="lesson-sidebar__body">
                        <div class="lesson-sidebar__header">
                            <a title="Главная" href="/course/home" id="ember1434" class="ref-color ember-view lesson-sidebar__course-title">
                                Главная
                            </a>
                            <!-- Поменяй под себя
                            <div class="lesson-sidebar__course-progress-wrap">
                                <p class="lesson-sidebar__course-progress">Прогресс по курсу:
                                    <span>69/100</span>
                                </p>
                                <span aria-valuemax="100" aria-valuemin="0" aria-valuenow="69" role="progressbar"
                                      id="ember1437" class="progress-line ember-view lesson-sidebar__progress-line">
                                    <svg
                                            height="8px" width="214px">
                                    <line class="progress-line__full-line" x1="4px" y1="4px" x2="210px" y2="4px"
                                          stroke-width="4px" stroke-linecap="round"></line>
                                    <line class="progress-line__progress" x1="4px" y1="4px" x2="160px" y2="4px"
                                          stroke-width="4px" stroke-linecap="round"></line>
                                    </svg>
                                    <span aria-hidden="true" class="progress-line__numbers ">69 / 100</span>
                                </span>
                            </div>-->
                        </div>
                        <!-- Организуй список -->
                        <div class="lesson-sidebar__content custom-scrollbar custom-scrollbar_dark">
                        <#list 1..lessonCount as indexLesson>
                            <nav id="ember1438" class="toc-sections ember-view lesson-sidebar__toc"
                                 aria-label="Навигация по курсу">

                                <div class="lesson-sidebar__module-header sidebar-module-header" data-section="117111"
                                     role="directory" aria-expanded="false">
                                    <div class="line-progress-bar"></div>
                                    <div class="line-progress-bar-green" style="height: 100%;"></div>
                                    <div class="sidebar-module-header__title">
                                        ${lessonList[indexLesson - 1].name}
                                    </div>
                                </div>
                                <div class="lesson-sidebar__toc-inner" data-section="117111">
                                    <#if lessonList[indexLesson - 1].name != "Аттестация">
                                    <#list 1..articleCount[indexLesson - 1] as indexArticle>
                                    <div data-unit="291937" id="ember1513"
                                         class="with-lazy-loading toc-lesson ember-view">
                                        <div>
                                            <a href="${'/course/lesson/'+ articleList[articleOffset[indexLesson - 1] + indexArticle - 1].id}" id="ember2161"
                                               class="ref-color ember-view lesson-sidebar__lesson">
                                                <div class="line-progress-bar"></div>
                                                <div class="line-progress-bar-green" style="height: 100%;"></div>
                                                <span class="lesson-sidebar__lesson-name">${articleList[articleOffset[indexLesson - 1] + indexArticle - 1].name}</span>
                                            </a>
                                        </div>
                                    </div>
                                    </#list>
                                    </#if>
                                    <div data-unit="291938" id="ember1515"
                                         class="with-lazy-loading toc-lesson ember-view">
                                        <div>
                                            <a href="${'/course/test/'+lessonList[indexLesson - 1].id}" id="ember2162"
                                               class="ref-color ember-view lesson-sidebar__lesson">
                                                <div class="line-progress-bar"></div>
                                                <div class="line-progress-bar-green" style="height: 100%;"></div>
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
</#macro>

<#macro header menu>
<header id="main-header" class="main-header no-print u-grey-80 ">
    <div id="custom-navbar-slot"></div>

    <nav id="main-navbar" class="navbar" aria-label="Общая навигация по сайту">
        <nav class="u-hidden-lg u-hidden-xl u-menu u-menu-dropdown u-offcanvas u-menu-1">
                            <#if menu=="y">
            <div class="menu-collapse">
                <a class="u-button-style u-nav-link" href="#" style="font-size: calc(1em + 12px);">
                    <svg class="u-svg-link" viewBox="0 0 24 24">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-98b0"></use>
                    </svg>
                    <svg class="u-svg-content" version="1.1" id="svg-98b0" viewBox="0 0 16 16" x="0px" y="0px"
                         xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg">
                        <g>
                            <rect y="1" width="16" height="2"></rect>
                            <rect y="7" width="16" height="2"></rect>
                            <rect y="13" width="16" height="2"></rect>
                        </g>
                    </svg>
                </a>
            </div>
            <div class="u-custom-menu u-nav-container-collapse">
                <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
                    <div class="u-inner-container-layout u-sidenav-overflow">
                        <div class="u-menu-close"></div>
                        <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2">
                            <#list 1..lessonCount as indexLesson>
                                <#if lessonList[indexLesson - 1].name != "Аттестация">
                                    <#list 1..articleCount[indexLesson - 1] as indexArticle>

                                        <li class="u-nav-item">
                                            <a href="${'/course/lesson/'+ articleList[articleOffset[indexLesson - 1] + indexArticle - 1].id}" class="u-button-style u-nav-link">
                                                ${articleList[articleOffset[indexLesson - 1] + indexArticle - 1].name}
                                            </a>
                                        </li>
                                    </#list>
                                </#if>
                                <li class="u-nav-item">
                                    <a href="${'/course/test/'+lessonList[indexLesson - 1].id}" class="u-button-style u-nav-link">
                                        <#if lessonList[indexLesson - 1].name != "Аттестация">
                                            Тест по разделу ${lessonList[indexLesson - 1].name}
                                        <#else>
                                            Аттестация
                                        </#if>
                                    </a>
                                </li>
                            </#list>
                        </ul>
                    </div>
                </div>
                <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
            </div>
                            </#if>
        </nav>

        <nav class="u-hidden-md u-hidden-sm u-hidden-xs u-menu u-menu-dropdown u-offcanvas u-menu-2">
            <div class="menu-collapse">
                <a class="u-button-style u-nav-link" href="#">
                    <svg class="u-svg-link" viewBox="0 0 24 24"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-c399"></use></svg>
                    <svg class="u-svg-content" version="1.1" id="svg-c399" viewBox="0 0 16 16" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg"><g><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
                    </g></svg>
                </a>
            </div>
        </nav>

        <div class="navbar__spacer"></div>
<style>
.dropbtn {
    background-color: #333333;
    color: gray;
    border: none;
    cursor: pointer;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    right: 0;
    background-color: #333333;
    min-width: 200px;
    border-radius: 5px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: white;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {
    border-radius: 5px;
    background-color: #252525;}
.dropdown:hover .dropdown-content {
    border-radius: 5px;
    display: block;}
</style>
        <#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />
        <div id="ember22" class="drop-down drop-down-menu ember-view navbar__profile">
            <div aria-expanded="false" aria-haspopup="true" id="ember23"
                 class="drop-down__toggler drop-down-toggler drop-down-toggler--auto-toggle ember-view">
                    <div class="dropdown" style="float:right;">

                        <@security.authorize access="isAuthenticated()">
                            <img class="dropbtn navbar__profile-img" src="/course/images/user.png">
                        </@security.authorize>

                        <@security.authorize access="!isAuthenticated()">
                            <img class="dropbtn navbar__profile-img" src="/course/open-resources/images/add-user.png">
                        </@security.authorize>

                        <div class="dropdown-content">

                            <a href="/course/home">Главная</a>
                        <@security.authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MODER')">
                            <a href="/course/add_course">Добавить раздел</a>
                            <a href="/course/add_test/0">Добавить тест</a>
                        </@security.authorize>
                        <@security.authorize access="isAuthenticated()">
                            <a href="/course/journal">Журнал</a>
                            <a href="/course/logout">Выход</a>
                        </@security.authorize>

                        <@security.authorize access="!isAuthenticated()">
                            <a href="/course/authentication">Вход</a>
                        </@security.authorize>

                        </div>
                    </div>

            </div>
        </div>
    </nav>
</header>
</#macro>

<#macro auth>

</#macro>