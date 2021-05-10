<#import "parts/common.ftlh" as c>

<@c.page>
<div class="container mt-5">
    <h5>${username}</h5>
    ${message?ifExists}
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> <#if .locale = 'kz'>
                    Кәзіргі пароль:
                <#elseIf .locale = 'ru'>
                    Текущий пароль:
                <#else>
                    Current password:
                </#if> </label>
            <div class="col-sm-5">
                <input type="password" name="password" class="form-control" placeholder="Password">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">  <#if .locale = 'kz'>
                    Жаңа пароль:
                <#elseIf .locale = 'ru'>
                    Новый пароль:
                <#else>
                    New password:
                </#if> </label>
            <div class="col-sm-5">
                <input type="password" name="password" class="form-control" placeholder="Password">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">  <#if .locale = 'kz'>
                     Пароль қайталаныз:
                <#elseIf .locale = 'ru'>
                    Повторите пароль:
                <#else>
                    Repeat password:
                </#if>  </label>
            <div class="col-sm-5">
                <input type="password" name="password" class="form-control" placeholder="Password">
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary mb-2" type="submit"> <#if .locale = 'kz'>
                Пароль өзгерту
            <#elseIf .locale = 'ru'>
                Изменить пароль
            <#else>
                Change password
            </#if> </button>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">  <#if .locale = 'kz'>
                    Почта:
                <#elseIf .locale = 'ru'>
                    Почта:
                <#else>
                    Email:
                </#if>  </label>
            <div class="col-sm-5">
                <input type="email" disabled name="email" class="form-control" placeholder="some@some.com" value="${email!''}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">  <#if .locale = 'kz'>
                    Жаңа почта:
                <#elseIf .locale = 'ru'>
                    Новая почта:
                <#else>
                    New Email:
                </#if> </label>
            <div class="col-sm-5">
                <input type="email" name="email" class="form-control" placeholder="some@some.com">
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary mb-2" type="submit"> <#if .locale = 'kz'>
                Почта өзгерту
            <#elseIf .locale = 'ru'>
                Изменить почту
            <#else>
                Change Email
            </#if> </button>
    </form>
</div>
</@c.page>