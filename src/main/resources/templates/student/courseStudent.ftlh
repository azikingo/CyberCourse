    <#import "../parts/common.ftlh" as c>
    <@c.page>
<div class="container mt-5">
    <#if url == "/student/my-courses">
        <div class="form-row">
            <div class="form-group col-sm-9">
                <form method="get" action="${url}" class="form-inline">
                    <input type="text" class="form-control" name="filter" value="${filter?ifExists}" placeholder="Search course">
                    <div class="col-4">
                        <div class="mr-3 my-1">
                            <select class="selectpicker form-control"
                                    name="selectedCategory" id="selectedCategory" data-live-search="true"
                                    title="Филиал таңда..." data-style="btn btn-sm btn-info">
                                <option value="0" <#if !(selectedCategory??)>${'selected'}</#if>>...</option>
                                <#list categories as category>
                                    <option value="${category.id}" <#if selectedCategory??>${(category.id==selectedCategory.id)?then("selected", "")}</#if>>
                                        ${category.titleKz!''}
                                    </option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary ml-2">Search</button>
                </form>
            </div>
        </div>
        <div class="row">
            <#list courses as course>
                <div class="card m-4" style="width: 18rem;">
                    <img class="card-img-top" src="/img/${course.photoPath!''}" alt="Course photo">
                    <div class="card-body">
                        <h5 class="card-title">${course.titleKz!''}</h5>
                        <p class="card-text">${course.descriptionKz!''}</p>
                        <em class="card-text">${course.price!''} kzt</em>
                    </div>
                    <div class="card-footer">
                        <a href="${url}/${course.id?c}" class="btn btn-primary">Толығырақ</a>
                    </div>
                </div>
            <#else>
                <p>Сіз ешқандай курсқа тіркелмегенсіз</p>
                <a href="/course" class="btn btn-primary">Тіркелу</a>
            </#list>
        </div>
    <#elseIf url?contains("/student/my-courses/")>
        <div class="row">
            <img class="card-img-top" src="/img/${course.photoPath!''}"
                 style="width: 100%; height: 300px" alt="Course photo">
            <div>
                <h1><em>${course.titleKz!''}</em></h1>
                <#list course.categories as category>
                    <em>${category.titleKz!''}<#sep>, </#sep></em>
                </#list>
                <h5>${course.descriptionKz!''}</h5>
                <h4><em>${course.price!''} kzt</em></h4>
                <p>Course duration: <em>${course.duration!'4h'}</em></p>
                <p>Course limit: <em>${course.limitTime!'5w'}</em></p>
            </div>
            <div>
                <p>Parts:</p>
                <#assign num = 0>
                <#list course.courseParts as coursePart>
                    <#assign num += 1>
                    <em>${num}) ${coursePart.titleKz!''}</em><br>
                </#list>
            </div>
        </div>
    </#if>
<#--    <#if url?contains("/student/course/")>-->
<#--        <div class="flex">-->
<#--            <img class="card-img-top" src="/img/${course.photoPath!''}"-->
<#--                 style="width: 100%; height: 300px" alt="Course photo">-->
<#--            <div>-->
<#--                <h1><em>${course.titleKz!''}</em></h1>-->
<#--                <#list course.categories as category>-->
<#--                    <em>${category.titleKz!''}<#sep>, </#sep></em>-->
<#--                </#list>-->
<#--                <h5>${course.descriptionKz!''}</h5>-->
<#--                <h4><em>${course.price!''} kzt</em></h4>-->
<#--                <p>Course duration: <em>${course.duration!'4'} h</em></p>-->
<#--                <p>Course limit: <em>${course.limitTime!'5 '} w</em></p>-->
<#--                <a href="${url}/subscribe" class="btn btn-primary">Тіркелу</a>-->
<#--            </div>-->
<#--            <div>-->
<#--                <h4><em>Course parts</em></h4>-->
<#--                <#list course.courseParts as coursePart>-->
<#--                    <p>${coursePart.titleKz!''} : <em>${coursePart.duration?c} h</em></p>-->
<#--                </#list>-->
<#--            </div>-->
<#--        </div>-->
<#--    <#elseif url?contains("/student/course")>-->
<#--        <div class="d-flex justify-content-center">-->
<#--            <#list courses as course>-->
<#--                <div class="card m-4" style="width: 18rem;">-->
<#--                    <img class="card-img-top" src="/img/${course.photoPath!''}" alt="Course photo">-->
<#--                    <div class="card-body">-->
<#--                        <h5 class="card-title">${course.titleKz!''}</h5>-->
<#--                        <p class="card-text">${course.descriptionKz!''}</p>-->
<#--                        <em class="card-text">${course.price!''} kzt</em>-->
<#--                    </div>-->
<#--                    <div class="card-footer">-->
<#--                        <a href="${url}/${course.id?c}" class="btn btn-primary">Толығырақ</a>-->
<#--                    </div>-->
<#--                </div>-->
<#--            <#else>-->
<#--                Курс жоқ-->
<#--            </#list>-->
<#--        </div>-->
<#--    <#else>-->
<#--        --->
<#--    </#if>-->
</div>
</@c.page>