<#import "parts/common.ftlh" as c>

<@c.page>
<div class="container mt-5">

    List of users

    <table>
        <thead>
        <tr>
            <th> <#if .locale = 'kz'>
                    Аты
                <#elseIf .locale = 'ru'>
                    Имя
                <#else>
                    Name
                </#if> </th>
            <th> <#if .locale = 'kz'>
                    Рөлі
                <#elseIf .locale = 'ru'>
                    Роль
                <#else>
                    Role
                </#if> </th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><a href="/user/${user.id?c}"> <#if .locale = 'kz'>
                            Енгізу
                        <#elseIf .locale = 'ru'>
                            Добавить
                        <#else>
                            Edit
                        </#if> </a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</div>
</@c.page>