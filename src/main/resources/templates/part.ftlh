    <#import "parts/common.ftlh" as c>
    <@c.page>
<div class="row">
<div class="col-3">
    <ul class="list-group m-5">
        <div id="accordion" style="width: 20%; position: fixed">
            <div class="list-group">
                <div id="areaOne">
                    <a href="#" class="list-group-item list-group-item-action"
                       data-toggle="collapse" data-target="#menuOne" aria-expanded="true" aria-controls="menuOne">
                        Course
                    </a>
                </div>
                <div id="menuOne" class="collapse" aria-labelledby="areaOne" data-parent="#accordion">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <a href="/my-courses" style="text-decoration: none; margin: 1em">My courses</a>
                        </li>
                        <li class="list-group-item">
                            <a href="/my-courses/add" style="text-decoration: none; margin: 1em">Add new course</a>
                        </li>
                    </ul>
                </div>
                <div id="areaTwo">
                    <a href="#" class="list-group-item list-group-item-action"
                       data-toggle="collapse" data-target="#menuTwo" aria-expanded="true" aria-controls="menuTwo">
                        Course part
                    </a>
                </div>
                <div id="menuTwo" class="collapse" aria-labelledby="areaTwo" data-parent="#accordion">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <a href="/my-courses/${course.id?c}/parts" style="text-decoration: none; margin: 1em">Course parts</a>
                        </li>
                        <li class="list-group-item">
                            <a href="/my-courses/${course.id?c}/parts/add" style="text-decoration: none; margin: 1em">Add new course part</a>
                        </li>
                    </ul>
                </div>
                <#if url?contains("/parts/") && !url?contains("/parts/add")>
                    <div id="areaFour">
                        <a href="/my-courses/${course.id?c}/parts/${coursePart.id?c}/quiz" class="list-group-item list-group-item-action">
                            Course part quiz
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
            <div class="text-info text-center mx-1 mb-2">
                <#if url?contains("/parts/add")>
                    Жаңа бөлім енгізу
                <#else>
                    &#8220;${coursePart.titleKz!''}&#8221; бөлімін өзгерту
                </#if>
            </div>
            <div class="form-group mt-3">
                <form method="post">
                    <div class="form-group">
                        <label class="col-sm-6 col-form-label">
                            * Қазақша атауы
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
                            * Орысша атауы
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
                            * Ағылшынша атауы
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
                            * Қазақша түсіндірмесі
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
                            * Орысша түсіндірмесі
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
                            * Ағылшынша түсіндірмесі
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
                            * Ұзақтығы (Минутпен)
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
                            * Шектеуі (аптамен)
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
                            * Сабаққа сілтеме
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
        <#elseif url?contains("/parts/")>
            <div class="row">
                <div>
                    <h2><em>${coursePart.titleKz!''}</em></h2>
                    <p>${coursePart.descriptionKz!''}</p>
                    <p>Duration: <em>${coursePart.duration!''} h</em></p>
                    <p>Limit time: <em>${coursePart.limitTime!''} w</em></p>
                    <iframe width="720" height="450" src="${coursePart.videoLink!''}">
                    </iframe>
                </div>
                <div>
                    <a href="${url}/edit" class="btn btn-primary">Edit course part</a>
                    <#--------------------------------------Delete modal---------------------------------------->
                    <a href="#" class="btn btn-danger" data-toggle="modal"
                       data-target="#del${coursePart.id?c}">Delete course part</a>
                    <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog"
                         aria-labelledby="mySmallModalLabel" aria-hidden="true"
                         id="del${coursePart.id?c}">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">
                                        Сенімдісіз бе?
                                    </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>Сіз &#8220;${coursePart.getTitleKz()}&#8221; бөлімін
                                        жойғалы жатырсыз. Келісесіз бе?</p>
                                </div>
                                <div class="modal-footer">
                                    <form class="form-inline" action="${url}/del" method="post">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-success btn-sm px-3 mr-1">
                                            Иә
                                        </button>
                                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">
                                            Жоқ
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <#elseif url?contains("/parts")>
            <div class="row">
                <#list courseParts as coursePart>
                    <div class="card m-4">
                        <div class="card-body">
                            <h5 class="card-title">${coursePart.titleKz!''}</h5>
                            <p class="card-text">${coursePart.descriptionKz!''}</p>
                            <p class="card-text">Course duration: <em>${coursePart.duration!'4h'}</p></em>
                            <p class="card-text">Course limit time: <em>${coursePart.limitTime!'1w'}</p></em>
                            <iframe width="420" height="345" src="${coursePart.videoLink!''}">
                            </iframe>
                        </div>
                        <div class="card-footer">
                            <a href="${url}/${coursePart.id?c}" class="btn btn-primary">Толығырақ</a>
                        </div>
                    </div>
                <#else>
                    Курс бөлімдері тіркелмеген
                </#list>
            </div>
        </#if>
    </div>
</div>
</@c.page>