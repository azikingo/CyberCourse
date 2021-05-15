<#import "parts/common.ftlh" as c>
<#import "parts/pager.ftlh" as p>
<@c.page>
<div class="row mb-5">
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
                                    Добавиь новый курс
                                <#else>
                                    Add new course
                                </#if></a>
                        </li>
                    </ul>
                </div>
<#--                <div id="areaThree">-->
<#--                    <a href="#" class="list-group-item list-group-item-action"-->
<#--                       data-toggle="collapse" data-target="#menuThree" aria-expanded="true" aria-controls="menuThree">-->
<#--                        Category-->
<#--                    </a>-->
<#--                </div>-->
<#--                <div id="menuThree" class="collapse" aria-labelledby="areaThree" data-parent="#accordion">-->
<#--                    <ul class="list-group list-group-flush">-->
<#--                        <li class="list-group-item">-->
<#--                            <a href="/category" style="text-decoration: none; margin: 1em">Categories</a><br>-->
<#--                        </li>-->
<#--                        <li class="list-group-item">-->
<#--                            <a href="/addCategory" style="text-decoration: none; margin: 1em">Add new category</a>-->
<#--                        </li>-->
<#--                    </ul>-->
<#--                </div>-->
            </div>
        </div>
    </ul>
</div>
<div class="col-9">
    <div class="container mt-5">
        <#if url == "/my-courses">
            <div class="row">
                <div class="col-lg-12 col-12 my-5">
                    <form method="get" action="${url}" class="form-inline">
                        <input type="text" class="col-lg-3 col-3 form-control" name="filter" value="${filter?ifExists}" placeholder="Search course">
                        <div class="col-lg-5 col-5">
                            <select class="selectpicker form-select" name="selectedCategory" data-style="select-with-transition btn btn-primary" data-live-search="true">
                                <option value="0" <#if !(selectedCategory??)>${'selected'}</#if>>
                                    <#if .locale = 'kz'>
                                        Категория таңда...
                                    <#elseIf .locale = 'ru'>
                                        Выбери категорию...
                                    <#else>
                                        Choose category...
                                    </#if>
                                </option>
                                <#list categories as category>
                                    <option value="${category.id}" <#if selectedCategory??>${(category.id==selectedCategory.id)?then("selected", "")}</#if>>
                                        ${category.titleKz!''}
                                    </option>
                                </#list>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary ml-1">
                            <#if .locale = 'kz'>
                                Іздеу
                            <#elseIf .locale = 'ru'>
                                Пойск
                            <#else>
                                Search
                            </#if>
                        </button>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-12 my-3">
                    <hr class="m-0" style="opacity: 80%">
                </div>
            </div>
            <div class="row my-3">
                <@p.pager url courses />
                <div class="card-columns">
                    <#list courses.content as course>
                        <div class="card m-4" style="width: 18rem;">
                            <img class="card-img-top" src="/img/${course.photoPath!''}" alt="Course photo">
                            <div class="card-body">
                                <h5 class="card-title">${course.titleKz!''}</h5>
                                <p class="card-text">${course.descriptionKz!''}</p>
                                <em class="card-text">${course.price!''} kzt</em>
                            </div>
                            <div class="card-footer">
                                <a href="${url}/${course.id?c}" class="btn btn-primary">
                                    <#if .locale = 'kz'>
                                        Толығырақ
                                    <#elseIf .locale = 'ru'>
                                        Подробнее
                                    <#else>
                                        Read More
                                    </#if>
                                </a>
                            </div>
                        </div>
                    <#else>
                        <#if .locale = 'kz'>
                            Курс Тіркелмеген
                        <#elseIf .locale = 'ru'>
                            Курс не зарегестрирован
                        <#else>
                            Course not registered
                        </#if>
                    </#list>
                </div>
                <@p.pager url courses />
            </div>

        <#elseIf url == "/my-courses/add" || url?contains("/edit")>
            <div class="text-primary text-center mx-1 mb-2">
                <h4>
                    <#if url == "/my-courses/add">
                        <#if .locale = 'kz'>
                            Жаңа курс енгізу
                        <#elseIf .locale = 'ru'>
                            Добавить новый курс
                        <#else>
                            Add new course
                        </#if>
                    <#else>
                        <#if .locale = 'kz'>
                            &#8220;${course.titleKz!''}&#8221; курсын озгерту
                        <#elseIf .locale = 'ru'>
                            Изменить курс &#8220;${course.titleRu!''}&#8221;
                        <#else>
                            Change the course &#8220;${course.titleEn!''}&#8221;
                        </#if>
                    </#if>
                </h4>
            </div>
            <div class="form-group mt-3">
                <form method="post" enctype="multipart/form-data">
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
                               value="<#if course??>${course.titleKz!''}</#if>" name="titleKz" placeholder="Course title kz" />
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
                                * Русское название
                            <#else>
                                * Russian name
                            </#if>
                        </label>
                        <input type="text" class="form-control ${(titleRuError??)?string('is-invalid','')}"
                               value="<#if course??>${course.titleRu!''}</#if>" name="titleRu" placeholder="Course title ru" />
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
                               value="<#if course??>${course.titleEn!''}</#if>" name="titleEn" placeholder="Course title en" />
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
                                * Описание по-казахский
                            <#else>
                                * Kazakh description
                            </#if>
                        </label>
                        <textarea class="form-control ${(descriptionKzError??)?string('is-invalid', '')}"
                                  id="descriptionKz" name="descriptionKz"
                                  rows="4"><#if course??>${course.descriptionKz!''}</#if></textarea>
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
                                * Описание по-руский
                            <#else>
                                * Russian description
                            </#if>
                        </label>
                        <textarea class="form-control ${(descriptionRuError??)?string('is-invalid', '')}"
                                  id="descriptionRu" name="descriptionRu"
                                  rows="4"><#if course??>${course.descriptionRu!''}</#if></textarea>
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
                                * Описание по-англиский
                            <#else>
                                * English description
                            </#if>
                        </label>
                        <textarea class="form-control ${(descriptionEnError??)?string('is-invalid', '')}"
                                  id="descriptionEn" name="descriptionEn"
                                  rows="4"><#if course??>${course.descriptionEn!''}</#if></textarea>
                        <#if descriptionEnError??>
                            <div class="invalid-feedback">
                                ${descriptionEnError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-6 col-form-label">
                            <#if .locale = 'kz'>
                               Категория
                            <#elseIf .locale = 'ru'>
                                Категория
                            <#else>
                                Category
                            </#if>
                        </label>
                        <div class="col-sm-10">
                            <select class="selectpicker form-control"
                                    name="categories" id="categories" multiple data-actions-box="true" data-live-search="true"
                                    title="Категория..."
                                    data-selected-text-format="count > 5">
                                <#list categories as category>
                                    <#if course??>
                                        <option value="${category.id}"
                                            <#list course.categories as courseCategory>
                                                <#if category.id==courseCategory.id>selected</#if>
                                            </#list>
                                        >${category.titleKz!''}</option>
                                    <#else>
                                        <option value="${category.id}">${category.titleKz!''}</option>
                                    </#if>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-6 col-form-label">
                            <#if .locale = 'kz'>
                                * Бағасы
                            <#elseIf .locale = 'ru'>
                                * Цена
                            <#else>
                                * Price
                            </#if>
                        </label>
                        <input type="number" class="form-control"
                               value="<#if course??>${course.price?c}</#if>" name="price" placeholder="Course price" />
                        <#if priceError??>
                            <div class="invalid-feedback">
                                ${priceError}
                            </div>
                        </#if>
                    </div>
<#--                    <div class="form-group">-->
<#--                        <label class="col-sm-6 col-form-label">-->
<#--                            * Шектеуі (аптамен)-->
<#--                        </label>-->
<#--                        <input type="number" class="form-control"-->
<#--                               value="<#if course??>${course.limitTime?c}</#if>" name="limitTime" placeholder="Course limit time" />-->
<#--                        <#if limitTimeError??>-->
<#--                            <div class="invalid-feedback">-->
<#--                                ${limitTimeError}-->
<#--                            </div>-->
<#--                        </#if>-->
<#--                    </div>-->
                    <div class="form-group">
                        <img class="card-img-top" id="output" style="width: 100%; height: 350px"
                             <#if course??>src="/img/${course.photoPath!''}"</#if>/>
                        <div class="custom-file">
                            <input type="file" name="file" accept="image/*" id="customFile" onchange="loadFile(event)">
                            <label class="custom-file-label" for="customFile">
                                <#if .locale = 'kz'>
                                    Курс суреті...
                                <#elseIf .locale = 'ru'>
                                    Фото курса...
                                <#else>
                                    Course photo...
                                </#if>
                            </label>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <input type="hidden" name="id" value="<#if course??>${course.id}</#if>" />
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary"><#if url == "/my-courses/add">Add<#else><#if .locale = 'kz'>
                                Сақтау
                            <#elseIf .locale = 'ru'>
                                Сохранить
                            <#else>
                                Save
                            </#if></#if></button>
                    </div>
                </form>
            </div>
        <#elseIf url?contains("/my-courses/")>
            <div class="row">
                <div class="col-lg-12 col-12 my-5">
                    <img class="card-img-top" src="/img/${course.photoPath!''}"
                         style="width: 100%; height: 350px" alt="Course photo">
                </div>
                <div class="col-lg-12 col-12 my-3 text-center">
                    <h1><em>${course.titleKz!''}</em></h1>
                </div>
                <div class="col-lg-12 col-12 my-3 text-center">
                    <h5>${course.descriptionKz!''}</h5>
                </div>
                <div class="col-lg-6 col-6 my-3">
                    <#list course.categories as category>
                        <a href="/course?selectedCategory=${category.id?c}"><em>${category.titleKz!''}<#sep>, </#sep></em></a>
                    </#list>
                </div>
                <div class="col-lg-4 col-4 text-right my-3">
                    <h3><em>${course.price!''} kzt</em></h3>
                </div>
                <div class="col-lg-2 col-2 text-right my-3">
                </div>
                <div class="col-lg-12 col-12 mt-3">
                    <hr class="m-0" style="opacity: 80%">
                </div>
            </div>
            <div class="row justify-content-center mt-2">
                <a href="${url}/parts" class="btn btn-primary m-2"><#if .locale = 'kz'>
                        Бөліктері
                    <#elseIf .locale = 'ru'>
                        Части
                    <#else>
                        Parts
                    </#if></a>
                <a href="${url}/edit" class="btn btn-primary m-2"><#if .locale = 'kz'>
                        Курсты редакциялау
                    <#elseIf .locale = 'ru'>
                        Редактировать курс
                    <#else>
                        Edit course
                    </#if></a>
                <#--------------------------------------Delete modal---------------------------------------->
                <a href="#" class="btn btn-danger m-2" data-toggle="modal"
                   data-target="#del${course.id?c}">Delete course</a>
                <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog"
                     aria-labelledby="mySmallModalLabel" aria-hidden="true"
                     id="del${course.id?c}">
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
                                <p> <#if .locale = 'kz'>
                                        Сіз &#8220;${course.getTitleKz()}&#8221; курсын  жойғалы жатырсыз. Келісесіз бе?
                                    <#elseIf .locale = 'ru'>
                                        вы хотите отменить курс &#8220;${course.getTitleKz()}&#8221;. Согласны?
                                    <#else>
                                        you're going to delete &#8220;${course.getTitleKz()}&#8221; the course. Do you agree?
                                    </#if></p>
                            </div>
                            <div class="modal-footer">
                                <form class="form-inline" action="${url}/del" method="post">
                                    <input type="hidden" name="courseId" value="${course.getId()?c}"/>
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







        <#elseIf url == "/category">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col"> <#if .locale = 'kz'>
                            * Қазақша атауы
                        <#elseIf .locale = 'ru'>
                            * Казахское название
                        <#else>
                            * Kazakh name
                        </#if></th>
                    <th scope="col"><#if .locale = 'kz'>
                            * Орысша атауы
                        <#elseIf .locale = 'ru'>
                            * Русское название
                        <#else>
                            * Russian name
                        </#if></th>
                    <th scope="col"><#if .locale = 'kz'>
                            * Ағылшынша атауы
                        <#elseIf .locale = 'ru'>
                            * Англиское название
                        <#else>
                            * English name
                        </#if></th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <#assign num = 0>
                <#list categories as category>
                    <#assign num += 1>
                    <tr>
                        <th scope="row"><span class="badge-pill badge-primary py-1 font-9">${num}</span></th>
                        <td>${category.titleKz!''}</td>
                        <td>${category.titleRu!''}</td>
                        <td>${category.titleEn!''}</td>
                        <td>
                            <div class="row justify-content-end">
                                <div class="btn-group mr-3" role="group" aria-label="button group">
                                    <#--------------------------------------Edit modal---------------------------------------->
                                    <a href="#" class="badge-pill badge-warning btn-sm" data-toggle="modal"
                                       data-target="#edit${category.id?c}"><i class="fas fa-edit"></i></a>
                                    <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog"
                                         aria-labelledby="mySmallModalLabel" aria-hidden="true"
                                         id="edit${category.id?c}">
                                        <div class="modal-dialog modal-lg modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title"><#if .locale = 'kz'>
                                                           Өзгертіп сақтау
                                                        <#elseIf .locale = 'ru'>
                                                            Изменить и сохранить
                                                        <#else>
                                                            Edit and save
                                                        </#if></h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body justify-content-start">
                                                    <form action="${url}/update" method="post"
                                                          class="">
                                                        <div class="form-group row">
                                                            <label for="editTitleKz" class="col-sm-6 col-form-label">
                                                                <#if .locale = 'kz'>
                                                                    * Қазақша атауы
                                                                <#elseIf .locale = 'ru'>
                                                                    * Казахское название
                                                                <#else>
                                                                    * Kazakh name
                                                                </#if>
                                                            </label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control"
                                                                       id="editTitleKz" name="titleKz"
                                                                       value="<#if category??><#if category.titleKz??>${category.titleKz}</#if></#if>"
                                                                       placeholder="">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="editTitleRu" class="col-sm-6 col-form-label">
                                                                <#if .locale = 'kz'>
                                                                    * Орысша атауы
                                                                <#elseIf .locale = 'ru'>
                                                                    * Русское название
                                                                <#else>
                                                                    * Russian name
                                                                </#if>
                                                            </label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control"
                                                                       id="editTitleRu" name="titleRu"
                                                                       value="<#if category??><#if category.titleRu??>${category.titleRu}</#if></#if>"
                                                                       placeholder="">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="editTitleEn" class="col-sm-6 col-form-label">
                                                                <#if .locale = 'kz'>
                                                                    * Ағылшынша атауы
                                                                <#elseIf .locale = 'ru'>
                                                                    * Англиское название
                                                                <#else>
                                                                    * English name
                                                                </#if>
                                                            </label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control"
                                                                       id="editTitleEn" name="titleEn"
                                                                       value="<#if category??><#if category.titleEn??>${category.titleEn}</#if></#if>"
                                                                       placeholder="">
                                                            </div>
                                                        </div>
                                                        <input type="hidden" name="pollId" value="${category.id?c}">
                                                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                                        <div class="modal-footer ">
                                                            <div class="form-group row justify-content-end">
                                                                <button type="submit" class="btn btn-success btn-sm  mr-1">
                                                                    <i class="far fa-save fa-lg"></i></button>
                                                                <button type="button" class="btn btn-danger btn-sm mr-5"
                                                                        data-dismiss="modal"><i class="fas fa-undo-alt"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <#--------------------------------------Delete modal---------------------------------------->
                                    <a href="#" class="badge-pill badge-danger btn-sm" data-toggle="modal"
                                       data-target="#del${category.id?c}"><i class="far fa-trash-alt"></i></a>
                                    <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog"
                                         aria-labelledby="mySmallModalLabel" aria-hidden="true"
                                         id="del${category.id?c}">
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
                                                    <#if .locale = 'kz'>
                                                        Сіз &#8220;${course.getTitleKz()}&#8221; курсын  жойғалы жатырсыз. Келісесіз бе?
                                                    <#elseIf .locale = 'ru'>
                                                        вы хотите отменить курс &#8220;${course.getTitleKz()}&#8221;. Согласны?
                                                    <#else>
                                                        you're going to delete &#8220;${course.getTitleKz()}&#8221; the course. Do you agree?
                                                    </#if>
                                                </div>
                                                <div class="modal-footer">
                                                    <form class="form-inline" action="${url}/delete" method="post">
                                                        <input type="hidden" name="id" value="${category.getId()?c}"/>
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
                            </div>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        <#elseIf url == "/addCategory">
            <div class="form-group mt-3">
                <form method="post">
                    <div class="form-group">
                        <input type="text" class="form-control ${(tilteKzError??)?string('is-invalid','')}"
                               value="<#if category??>${category.titleKz!''}</#if>" name="titleKz" placeholder="category title kz" />
                        <#if titleKzError??>
                            <div class="invalid-feedback">
                                ${titleKzError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control ${(titleRuError??)?string('is-invalid','')}"
                               value="<#if category??>${category.titleRu!''}</#if>" name="titleRu" placeholder="category title ru" />
                        <#if titleRuError??>
                            <div class="invalid-feedback">
                                ${titleRuError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control ${(titleEnError??)?string('is-invalid','')}"
                               value="<#if category??>${category.titleEn!''}</#if>" name="titleEn" placeholder="category title en" />
                        <#if titleEnError??>
                            <div class="invalid-feedback">
                                ${titleEnError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                        <button type="submit" class="btn btn-primary"><#if .locale = 'kz'>
                               Енгізу
                            <#elseIf .locale = 'ru'>
                                Добавить
                            <#else>
                                Add
                            </#if></button>
                    </div>
                </form>
            </div>
        </#if>
    </div>
    </div>
</div>
<#include "parts/footer.ftlh">

<script>
    var loadFile = function(event) {
        var output = document.getElementById('output');
        output.src = URL.createObjectURL(event.target.files[0]);
        output.onload = function() {
            URL.revokeObjectURL(output.src) // free memory
        }
    };
</script>
</@c.page>