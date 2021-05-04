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
                                <a href="/my-courses" style="text-decoration: none; margin: 1em">Courses</a>
                            </li>
                            <li class="list-group-item">
                                <a href="/my-courses/addCourse" style="text-decoration: none; margin: 1em">Add new course</a>
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
                                <a href="/my-courses/${course.id?c}/addPart" style="text-decoration: none; margin: 1em">Add new course part</a>
                            </li>
                        </ul>
                    </div>
                    <div id="areaFour">
                        <a href="/my-courses/${course.id?c}/parts/${coursePart.id?c}/quiz" class="list-group-item list-group-item-action">
                            Course part quiz
                        </a>
                    </div>
                </div>
            </div>
        </ul>
    </div>
    <div class="col-9">
        <div class="container mt-5">
            <#if url?contains("/addQuestion") || url?contains("/edit")>
                <div class="form-group mt-3">
                    <div class="text-info text-center mx-1 mb-2">
                        <#if url?contains("/addQuestion")>
                            Жаңа сұрақ енгізу
                        <#else>
                            &#8220;${quizQuestion.textKz!''}&#8221; сұрағын өзгерту
                        </#if>
                    </div>
                    <form method="post">
                        <div class="form-group">
                            <label class="col-sm-6 col-form-label">
                                * Қазақша атауы
                            </label>
                            <input type="text" class="form-control ${(textKzError??)?string('is-invalid','')}"
                                   value="<#if quizQuestion??>${quizQuestion.textKz!''}</#if>" name="textKz" placeholder="Question text kz" />
                            <#if textKzError??>
                                <div class="invalid-feedback">
                                    ${textKzError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-6 col-form-label">
                                * Орысша атауы
                            </label>
                            <input type="text" class="form-control ${(textRuError??)?string('is-invalid','')}"
                                   value="<#if quizQuestion??>${quizQuestion.textRu!''}</#if>" name="textRu" placeholder="Question text ru" />
                            <#if textRuError??>
                                <div class="invalid-feedback">
                                    ${textRuError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-6 col-form-label">
                                * Ағылшынша атауы
                            </label>
                            <input type="text" class="form-control ${(textEnError??)?string('is-invalid','')}"
                                   value="<#if quizQuestion??>${quizQuestion.textEn!''}</#if>" name="textEn" placeholder="Question text en" />
                            <#if textEnError??>
                                <div class="invalid-feedback">
                                    ${textEnError}
                                </div>
                            </#if>
                        </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                        <input type="hidden" name="id" value="<#if quizQuestion??>${quizQuestion.id}</#if>" />
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary"><#if url?contains("/addQuestion")>Add<#else>Save</#if></button>
                        </div>
                    </form>
                </div>
            <#elseif url?contains("/quiz/")>
            <#elseif url?contains("/quiz/")>
                <form method="post">
                    <div class="row">
                        <div>
                            <h2><em>${quizQuestion.textKz!''}</em></h2>
                        </div>
                    </div>
                    <#list quizAnswers as quizAnswer>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="radio${quizAnswer.id?c}" ${quizAnswer.correctAnswer?then("checked","")}>
                            <label class="form-check-label" for="radio${quizAnswer.id?c}">
                                ${quizAnswer.textKz!''}
                            </label>
                        </div>
                    <#else>
                        Жауаптар енгізілмеген
                    </#list>
                    <a class="btn btn-primary" href="${url}/addAnswer" role="button">Add answer</a>
                    <button type="submit" class="btn btn-success">Save</button>
                </form>
            <#elseif url?contains("/quiz")>
                <#if quiz??>
                    <div class="row">
                        <div>
                            <h2><em>${quiz.titleKz!''}</em></h2>
                            <p>${quiz.descriptionKz!''}</p>
                        </div>
                    </div>
                    <input type="hidden" name="quizId" value="${quiz.getId()?c}"/>
                    <a class="btn btn-primary" href="${url}/addQuestion" role="button">Add question</a>
                    <a class="btn btn-warning" href="${url}/edit" role="button">Edit quiz</a>
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
                    <a class="btn btn-primary" href="/my-courses/${course.id?c}/parts/${coursePart.id?c}/quiz/addQuiz" role="button">Add quiz</a>
                </#if>
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
                </div>
            <#else>
                -
            </#if>
        </div>
    </div>
</@c.page>