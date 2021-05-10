<#import "parts/common.ftlh" as c>

<@c.page>
<div class="container mt-5">

    <#if .locale = 'kz'>
        Пайдаланушы редакторы
    <#elseIf .locale = 'ru'>
        Редактор Пользователей
    <#else>
        User Editor
    </#if>

    <form action="/user" method="post">
        <input type="text" name="username" value="${user.username}">
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked","")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit"> <#if .locale = 'kz'>
                Сақтау
            <#elseIf .locale = 'ru'>
                Сохранить
            <#else>
                Save
            </#if> </button>
    </form>
</div>
</@c.page>