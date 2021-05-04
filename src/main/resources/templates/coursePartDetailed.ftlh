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
                <div id="areaFour">
                    <a href="/my-courses/${course.id?c}/parts/${coursePart.id?c}/quiz" class="list-group-item list-group-item-action">
                        Course part quiz
                    </a>
                </div>
<#--                <div id="menuFour" class="collapse" aria-labelledby="areaFour" data-parent="#accordion">-->
<#--                    <ul class="list-group list-group-flush">-->
<#--                        <li class="list-group-item">-->
<#--                            <a href="/" style="text-decoration: none; margin: 1em">Quizes</a>-->
<#--                        </li>-->
<#--                        <li class="list-group-item">-->
<#--                            <a href="/" style="text-decoration: none; margin: 1em">Add new quiz</a>-->
<#--                        </li>-->
<#--                    </ul>-->
<#--                </div>-->
            </div>
        </div>
    </ul>
</div>
<div class="col-9">
    <div class="container mt-5">
        <#if url?contains("/quiz/add") || url?contains("/quiz/edit")>
            <div class="text-info text-center mx-1 mb-2">
                <#if url?contains("/quiz/add")>
                    Жаңа емтихан енгізу
                <#else>
                    &#8220;${quiz.titleKz!''}&#8221; емтиханын өзгерту
                </#if>
            </div>
            <div class="form-group mt-3">
                <form method="post">
                    <div class="form-group">
                        <label class="col-sm-6 col-form-label">
                            * Қазақша атауы
                        </label>
                        <input type="text" class="form-control ${(titleKzError??)?string('is-invalid','')}"
                               value="<#if quiz??>${quiz.titleKz!''}</#if>" name="titleKz" placeholder="Course part title kz" />
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
                               value="<#if quiz??>${quiz.titleRu!''}</#if>" name="titleRu" placeholder="Course part title ru" />
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
                               value="<#if quiz??>${quiz.titleEn!''}</#if>" name="titleEn" placeholder="Course part title en" />
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
                                  rows="4"><#if quiz??>${quiz.descriptionKz!''}</#if></textarea>
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
                                  rows="4"><#if quiz??>${quiz.descriptionRu!''}</#if></textarea>
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
                                  rows="4"><#if quiz??>${quiz.descriptionEn!''}</#if></textarea>
                        <#if descriptionEnError??>
                            <div class="invalid-feedback">
                                ${descriptionEnError}
                            </div>
                        </#if>
                    </div>
                    <#--                    <div class="form-group">-->
                    <#--                        <label class="col-sm-6 col-form-label">-->
                    <#--                            * Ұзақтығы (Минутпен)-->
                    <#--                        </label>-->
                    <#--                        <input type="number" class="form-control"-->
                    <#--                               value="<#if quiz??>${quiz.duration?c}</#if>" name="duration" placeholder="Course part duration" />-->
                    <#--                        <#if durationError??>-->
                    <#--                            <div class="invalid-feedback">-->
                    <#--                                ${durationError}-->
                    <#--                            </div>-->
                    <#--                        </#if>-->
                    <#--                    </div>-->
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <input type="hidden" name="id" value="<#if quiz??>${quiz.id}</#if>" />
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary"><#if url?contains("/quiz/add")>Add<#else>Save</#if></button>
                    </div>
                </form>
            </div>
        <#elseif url?contains("/quiz")>
            <#if quiz??>
                <div class="row">
                    <div>
                        <h2><em>${quiz.titleKz!''}</em></h2>
                        <p>${quiz.descriptionKz!''}</p>
                    </div>
                </div>
                <#if quizQuestions??>
                    <div class="rounded">
                        <div class="text-info"><b>Емтихан сұрақтары</b></div>
                        <table class="table table-sm table-hover">
                            <thead>
                            <tr class="">
                                <th scope="col">#</th>
                                <th scope="col" class="text-center">Сұрақ қазақша</th>
                                <th scope="col" class="text-center">Сұрақ орысша</th>
                                <th scope="col" class="text-center">Сұрақ ағылшынша</th>
                                <th scope="col" class="text-center">Толық ұпай</th>
                                <th scope="col"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <#assign num = 0>
                            <#list quizQuestions as quizQuestion>
                                <#assign num = num + 1>
                                <tr>
                                    <th scope="row" class="">${num}</th>
                                    <td class="text-center">${quizQuestion.textKz!''}</td>
                                    <td class="text-center">${quizQuestion.textRu!''}</td>
                                    <td class="text-center">${quizQuestion.textEn!''}</td>
                                    <td class="text-center">${quizQuestion.maxScore!'0'}</td>
                                    <td class="text-center">
                                        <div class="btn-group mr-3" role="group" aria-label="button group">
                                            <#--------------------------------------Edit modal---------------------------------------->
                                            <a href="${url}/${quizQuestion.id?c}/edit" class="badge-pill badge-warning btn-sm"><i class="fas fa-edit"></i></a>
                                            <#--------------------------------------Delete modal---------------------------------------->
                                            <a href="#" class="badge-pill badge-danger btn-sm" data-toggle="modal"
                                               data-target="#del${quizQuestion.id?c}"><i class="far fa-trash-alt"></i></a>
                                            <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog"
                                                 aria-labelledby="mySmallModalLabel" aria-hidden="true"
                                                 id="del${quizQuestion.id?c}">
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
                                                                <p>Сіз &#8220;${quizQuestion.getTextKz()}&#8221; сұрағын
                                                                    жойғалы жатырсыз. Келісесіз бе?</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <form class="form-inline" action="${url}/${quizQuestion.id?c}/del" method="post">
                                                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                                                <button type="submit" class="btn btn-success btn-sm px-3 mr-1">
                                                                    Ия
                                                                </button>
                                                                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">
                                                                    Жоқ
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="${url}/${quizQuestion.id?c}" class="badge-pill badge-success btn-sm"><i class="fas fa-arrow-right"></i></a>
                                        </div>
                                    </td>
                                </tr>
                            <#else>
                                <tr>
                                    <th>Ешқандай сұрақ енгізілмеген</th>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                </#if>
                <input type="hidden" name="quizId" value="${quiz.getId()?c}"/>
                <a class="btn btn-primary" href="${url}/${quiz.getId()?c}/addQuestion" role="button">Add question</a>
                <a class="btn btn-warning" href="${url}/edit" role="button">Edit quiz</a>
                <#--------------------------------------Delete modal---------------------------------------->
                <a href="#" class="btn btn-danger" data-toggle="modal"
                   data-target="#del${quiz.id?c}">Delete quiz</a>
                <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog"
                     aria-labelledby="mySmallModalLabel" aria-hidden="true"
                     id="del${quiz.id?c}">
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
                                <p>Сіз &#8220;${quiz.getTitleKz()}&#8221; емтиханын
                                    жойғалы жатырсыз. Келісесіз бе?</p>
                            </div>
                            <div class="modal-footer">
                                <form class="form-inline" action="${url}/del" method="post">
                                    <input type="hidden" name="quizId" value="${quiz.getId()?c}"/>
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
            <#else>
                <a class="btn btn-primary" href="/my-courses/${course.id?c}/parts/${coursePart.id?c}/quiz/add" role="button">Add quiz</a>
            </#if>
        <#elseif url?contains("/parts/")>
            -
        <#else>
            -
        </#if>
    </div>
</div>
</@c.page>