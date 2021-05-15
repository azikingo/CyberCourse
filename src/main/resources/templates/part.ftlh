<#import "parts/common.ftlh" as c>
<@c.page>
<div class="row pb-5">
    <div class="col-3">
        <ul class="list-group m-5">
            <div id="accordion" style="width: 20%; position: fixed">
                <div class="list-group">
                    <div id="areaOne">
                        <a href="#" class="list-group-item list-group-item-action"
                           data-toggle="collapse" data-target="#menuOne" aria-expanded="true" aria-controls="menuOne">
                            <#if .locale = 'kz'>
                                Курс
                            <#elseIf .locale = 'ru'>
                                Курс
                            <#else>
                               Course
                            </#if>

                        </a>
                    </div>
                    <div id="menuOne" class="collapse" aria-labelledby="areaOne" data-parent="#accordion">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <a href="/my-courses" style="text-decoration: none; margin: 1em"><#if .locale = 'kz'>
                                        Менің курстарым
                                    <#elseIf .locale = 'ru'>
                                        Мой курсы
                                    <#else>
                                        My courses
                                    </#if></a>
                            </li>
                            <li class="list-group-item">
                                <a href="/my-courses/add" style="text-decoration: none; margin: 1em"><#if .locale = 'kz'>
                                        Жаңа курс қосу
                                    <#elseIf .locale = 'ru'>
                                        Добавить новый курс
                                    <#else>
                                        Add New Course
                                    </#if></a>
                            </li>
                        </ul>
                    </div>
                    <div id="areaTwo">
                        <a href="#" class="list-group-item list-group-item-action"
                           data-toggle="collapse" data-target="#menuTwo" aria-expanded="true" aria-controls="menuTwo">
                            <#if .locale = 'kz'>
                                Курстың бөлігі
                            <#elseIf .locale = 'ru'>
                                Часть курса
                            <#else>
                                Course part
                            </#if>
                        </a>
                    </div>
                    <div id="menuTwo" class="collapse" aria-labelledby="areaTwo" data-parent="#accordion">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <a href="/my-courses/${course.id?c}/parts" style="text-decoration: none; margin: 1em"><#if .locale = 'kz'>
                                        Курстың бөлігтері
                                    <#elseIf .locale = 'ru'>
                                        Части курса
                                    <#else>
                                        Course parts
                                    </#if></a>
                            </li>
                            <li class="list-group-item">
                                <a href="/my-courses/${course.id?c}/parts/add" style="text-decoration: none; margin: 1em"><#if .locale = 'kz'>
                                        Курстың бөлігін қосу
                                    <#elseIf .locale = 'ru'>
                                        Добавить часть курса
                                    <#else>
                                        Add course part
                                    </#if></a>
                            </li>
                        </ul>
                    </div>
                    <#if url?contains("/parts/") && !url?contains("/parts/add")>
                        <div id="areaFour">
                            <a href="/my-courses/${course.id?c}/parts/${coursePart.id?c}/quiz" class="list-group-item list-group-item-action">
                                <#if .locale = 'kz'>
                                    Курстың бөлігіне тест
                                <#elseIf .locale = 'ru'>
                                    Тест на часть курса
                                <#else>
                                    Course part quiz
                                </#if>
                            </a>
                        </div>
                    </#if>
                </div>
            </div>
        </ul>
    </div>
    <div class="col-9">
        <div class="container mt-5">
            <#if url?contains("/parts/add") || url?contains("/edit")>
                <div class="text-primary text-center mx-1 mb-2">
                    <h4>
                        <#if url?contains("/parts/add")>
                            <#if .locale = 'kz'>
                                Жаңа бөлім енгізу
                            <#elseIf .locale = 'ru'>
                                Добавить новый раздел
                            <#else>
                                Add new section
                            </#if>
                        <#else>
                            <#if .locale = 'kz'>
                                &#8220;${coursePart.titleKz!''}&#8221; бөлімін өзгерту
                            <#elseIf .locale = 'ru'>
                                Изменить раздел &#8220;${coursePart.titleRu!''}&#8221;
                            <#else>
                                Change the section &#8220;${coursePart.titleEn!''}&#8221;
                            </#if>
                        </#if>
                    </h4>
                </div>
                <div class="form-group mt-3">
                    <form method="post">
                        <div class="form-group">
                            <label class="col-sm-6 col-form-label">
                                <#if .locale = 'kz'>
                                    * Қазақша атауы
                                <#elseIf .locale = 'ru'>
                                    * Казахское название
                                <#else>
                                    * Kazakh name
                                </#if>
                            </label>
                            <input type="text" class="form-control ${(titleKzError??)?string('is-invalid','')}"
                                   value="<#if coursePart??>${coursePart.titleKz!''}</#if>" name="titleKz" placeholder="Course part title kz" />
                            <#if titleKzError??>
                                <div class="invalid-feedback">
                                    ${titleKzError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-6 col-form-label">
                                <#if .locale = 'kz'>
                                    * Орысша атауы
                                <#elseIf .locale = 'ru'>
                                    Русское название
                                <#else>
                                    Russian name
                                </#if>
                            </label>
                            <input type="text" class="form-control ${(titleRuError??)?string('is-invalid','')}"
                                   value="<#if coursePart??>${coursePart.titleRu!''}</#if>" name="titleRu" placeholder="Course part title ru" />
                            <#if titleRuError??>
                                <div class="invalid-feedback">
                                    ${titleRuError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-6 col-form-label">
                                <#if .locale = 'kz'>
                                    * Ағылшынша атауы
                                <#elseIf .locale = 'ru'>
                                    * Англиское название
                                <#else>
                                    * English name
                                </#if>
                            </label>
                            <input type="text" class="form-control ${(titleEnError??)?string('is-invalid','')}"
                                   value="<#if coursePart??>${coursePart.titleEn!''}</#if>" name="titleEn" placeholder="Course part title en" />
                            <#if titleEnError??>
                                <div class="invalid-feedback">
                                    ${titleEnError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-6 col-form-label">
                                <#if .locale = 'kz'>
                                    * Қазақша түсіндірмесі
                                <#elseIf .locale = 'ru'>
                                    * Казахское описание
                                <#else>
                                    * Kazakh description
                                </#if>
                            </label>
                            <textarea class="form-control ${(descriptionKzError??)?string('is-invalid', '')}"
                                      id="descriptionKz" name="descriptionKz"
                                      rows="4"><#if coursePart??>${coursePart.descriptionKz!''}</#if></textarea>
                            <#if descriptionKzError??>
                                <div class="invalid-feedback">
                                    ${descriptionKzError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-6 col-form-label">
                                <#if .locale = 'kz'>
                                    * Орысша түсіндірмесі
                                <#elseIf .locale = 'ru'>
                                    * Русское описание
                                <#else>
                                    * Russian description
                                </#if>
                            </label>
                            <textarea class="form-control ${(descriptionRuError??)?string('is-invalid', '')}"
                                      id="descriptionRu" name="descriptionRu"
                                      rows="4"><#if coursePart??>${coursePart.descriptionRu!''}</#if></textarea>
                            <#if descriptionRuError??>
                                <div class="invalid-feedback">
                                    ${descriptionRuError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-6 col-form-label">
                                <#if .locale = 'kz'>
                                    * Ағылшынша түсіндірмесі
                                <#elseIf .locale = 'ru'>
                                    * Англиское описание
                                <#else>
                                    * English description
                                </#if>
                            </label>
                            <textarea class="form-control ${(descriptionEnError??)?string('is-invalid', '')}"
                                      id="descriptionEn" name="descriptionEn"
                                      rows="4"><#if coursePart??>${coursePart.descriptionEn!''}</#if></textarea>
                            <#if descriptionEnError??>
                                <div class="invalid-feedback">
                                    ${descriptionEnError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-6 col-form-label">
                                <#if .locale = 'kz'>
                                    * Ұзақтығы(Минутпен)
                                <#elseIf .locale = 'ru'>
                                    * Продолжительность(Минуты)
                                <#else>
                                    * Duration(Minutes)
                                </#if>
                            </label>
                            <input type="number" class="form-control"
                                   value="<#if coursePart??>${coursePart.duration?c}</#if>" name="duration" placeholder="Course part duration" />
                            <#if durationError??>
                                <div class="invalid-feedback">
                                    ${durationError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-6 col-form-label">
                                <#if .locale = 'kz'>
                                    * Шектеуі(Аптамен)
                                <#elseIf .locale = 'ru'>
                                    * Ограничение (В Неделях)
                                <#else>
                                    * Limit (Per Week)
                                </#if>
                            </label>
                            <input type="number" class="form-control"
                                   value="<#if coursePart??>${coursePart.limitTime?c}</#if>" name="limitTime" placeholder="Course part limit time" />
                            <#if limitTimeError??>
                                <div class="invalid-feedback">
                                    ${limitTimeError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-6 col-form-label">
                                <#if .locale = 'kz'>
                                    * Сабаққа сілтеме
                                <#elseIf .locale = 'ru'>
                                    * Ссылка на урок
                                <#else>
                                    * Link to the lesson
                                </#if>

                            </label>
                            <input type="text" class="form-control ${(videoLinkError??)?string('is-invalid','')}"
                                   value="<#if coursePart??>${coursePart.videoLink!''}</#if>" name="videoLink" placeholder="Video link" />
                            <#if videoLinkError??>
                                <div class="invalid-feedback">
                                    ${videoLinkError}
                                </div>
                            </#if>
                        </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                        <input type="hidden" name="id" value="<#if coursePart??>${coursePart.id?c}</#if>" />
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary"><#if url?contains("/parts/add")>Add<#else>Save</#if></button>
                        </div>
                    </form>
                </div>
            <#elseIf url?contains("/parts/")>
                <div class="row">
                    <div class="col-lg-12 col-12 mt-3">
                        <iframe width="100%" height="600" src="${coursePart.videoLink!''}">
                        </iframe>
                    </div>
                    <div class="col-lg-12 text-center col-12 mt-3">
                        <h2><em>${coursePart.titleKz!''}</em></h2>
                    </div>
                    <div class="col-lg-12 text-center col-12 mt-3">
                        <p>${coursePart.descriptionKz!''}</p>
                    </div>
                    <div class="col-lg-12 col-12 mt-2">
                        <p> <#if .locale = 'kz'>
                                Ұзақтығы
                            <#elseIf .locale = 'ru'>
                                Продолжительность
                            <#else>
                                Duration
                            </#if> <em>${coursePart.duration!''} h</em></p>
                    </div>
                    <div class="col-lg-12 col-12">
                        <p>  <#if .locale = 'kz'>
                                 Шектеулі уақыт:
                            <#elseIf .locale = 'ru'>
                                 Ограничение времени:
                            <#else>
                                 Limit in time:
                            </#if> <em>${coursePart.limitTime!''} w</em></p>
                    </div>
                </div>
                <div class="col-lg-12 col-12 my-3">
                    <hr class="m-0" style="opacity: 80%">
                </div>

                <div class="row justify-content-center mb-2">
                    <a href="${url}/edit" class="btn btn-primary m-2">
                        <#if .locale = 'kz'>
                             Курс бөлігін өзгерту
                        <#elseIf .locale = 'ru'>
                             Редактировать часть курса
                        <#else>
                             Edit course part
                        </#if></a>
                    <#--------------------------------------Delete modal---------------------------------------->
                    <a href="#" class="btn btn-danger m-2" data-toggle="modal"
                       data-target="#del${coursePart.id?c}"><#if .locale = 'kz'>
                            Курс бөлігін жою
                        <#elseIf .locale = 'ru'>
                            Удалить часть курса
                        <#else>
                            Delete course part
                        </#if></a>
                    <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog"
                         aria-labelledby="mySmallModalLabel" aria-hidden="true"
                         id="del${coursePart.id?c}">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">
                                        <#if .locale = 'kz'>
                                           Сенімдісіз бе?
                                        <#elseIf .locale = 'ru'>
                                            Вы уверены?
                                        <#else>
                                            Are you sure?
                                        </#if>
                                    </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>
                                        <#if .locale = 'kz'>
                                            Сіз &#8220;${coursePart.getTitleKz()}&#8221; бөлімін жойғалы жатырсыз. Келісесіз бе?
                                        <#elseIf .locale = 'ru'>
                                            Вы собираетесь удалить &#8220;${coursePart.getTitleRu()}&#8221; часть курса. Согласны?
                                        <#else>
                                            You're going to delete your &#8220;${coursePart.getTitleEn()}&#8221; course part. Do you agree?
                                        </#if></p>
                                </div>
                                <div class="modal-footer">
                                    <form class="form-inline" action="${url}/del" method="post">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-success btn-sm px-3 mr-1">
                                            <#if .locale = 'kz'>
                                                Иә
                                            <#elseIf .locale = 'ru'>
                                                Да
                                            <#else>
                                               Yes
                                            </#if>

                                        </button>
                                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">
                                            <#if .locale = 'kz'>
                                                Жоқ
                                            <#elseIf .locale = 'ru'>
                                                Нет
                                            <#else>
                                                No
                                            </#if>

                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <#elseIf url?contains("/parts")>
                <div class="row">
                    <#assign num = 0>
                    <#list courseParts as coursePart>
                        <#assign num += 1>
                        <div class="card m-4">
                            <div class="card-body">
                                <h5 class="card-title">${num}) ${coursePart.titleKz!''}</h5>
                                <p class="card-text">${coursePart.descriptionKz!''}</p>
                                <p class="card-text">Course duration: <em>${coursePart.duration!'4h'}</p></em>
                                <p class="card-text">Course limit time: <em>${coursePart.limitTime!'1w'}</p></em>
                                <iframe width="420" height="345" src="${coursePart.videoLink!''}">
                                </iframe>
                            </div>
                            <div class="card-footer">
                                <a href="${url}/${coursePart.id?c}" class="btn btn-primary">
                                    <#if .locale = 'kz'>
                                        Толығырақ
                                    <#elseIf .locale = 'ru'>
                                       Подробнее
                                    <#else>
                                        Read more
                                    </#if>
                                </a>
                            </div>
                        </div>
                    <#else>
                        <div class="row">
                            <h3 class="col-12 text-warning">
                                <#if .locale = 'kz'>
                                    Курс бөлімдері тіркелмеген
                                <#elseIf .locale = 'ru'>
                                    Части курсы незарегестрированы
                                <#else>
                                    Course part unregistered
                                </#if>
                            </h3>
                        </div>
                        <div class="row" style="height: 23em"></div>
                    </#list>
                </div>
            </#if>
        </div>
    </div>
</div>
<#include "parts/footer.ftlh">
</@c.page>