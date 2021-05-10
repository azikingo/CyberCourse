<#import "parts/common.ftlh" as c>
<#import "parts/pager.ftlh" as p>
<#import "/spring.ftl" as spring/>
<#include "parts/security.ftlh">

<@c.page>
<div style="background: aliceblue">
    <div class="container">
        <#if url == "/course">
            <div class="row">
                <div class="col-lg-12 col-12 my-5">
                    <form method="get" action="${url}" class="form-inline">
                        <input type="text" class="col-lg-3 col-3 form-control" name="filter" value="${filter?ifExists}" placeholder="Search course">
                        <div class="col-lg-5 col-5">
                            <select class="selectpicker form-select" name="selectedCategory" data-style="select-with-transition btn btn-primary" data-live-search="true">
                                <option value="0" <#if !(selectedCategory??)>${'selected'}</#if>>...</option>
                                <#list categories as category>
                                    <option value="${category.id}" <#if selectedCategory??>${(category.id==selectedCategory.id)?then("selected", "")}</#if>>
                                        ${category.titleKz!''}
                                    </option>
                                </#list>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary ml-1"><#if .locale = 'kz'>
                                Іздеу
                            <#elseIf .locale = 'ru'>
                                Пойск
                            <#else>
                                Search
                            </#if></button>
                    </form>
                </div>
            </div>
            <div class="row">
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
                                    <a href="${url}/${course.id?c}" class="btn btn-primary"><#if .locale = 'kz'>
                                            Толығырақ
                                        <#elseIf .locale = 'ru'>
                                         Подробнее
                                        <#else>
                                            Read More
                                        </#if></a>
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
        <#elseIf url?contains("/course/")>
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
                <div class="col-lg-12 col-12 my-3">
                    <#list course.categories as category>
                        <em>${category.titleKz!''}<#sep>, </#sep></em>
                    </#list>
                </div>
                <div>
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
                <#if isStudent>
                    <div>
                        <a href="/student/my-courses/${course.id?c}/sub" class="btn btn-primary"><#if .locale = 'kz'>
                                Тіркелу
                            <#elseIf .locale = 'ru'>
                                Подписаться
                            <#else>
                                Subscribe
                            </#if></a>
                    </div>
                </#if>
            </div>
        </#if>
    </div>
</div>
</@c.page>