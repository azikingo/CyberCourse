<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> <#if .locale = 'kz'>
                    Пайдаланушы аты:
                <#elseIf .locale = 'ru'>
                    Имя Пользователя:
                <#else>
                    User Name:
                </#if> </label>
            <div class="col-sm-5">
                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid','')}" placeholder="User name">
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> <#if .locale = 'kz'>
                    Пароль:
                <#elseIf .locale = 'ru'>
                    Пароль:
                <#else>
                    Password:
                </#if> </label>
            <div class="col-sm-5">
                <input type="password" name="password"
                       class="form-control ${(passwordError??)?string('is-invalid','')}" placeholder="Password">
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> <#if .locale = 'kz'>
                        Пароль:
                    <#elseIf .locale = 'ru'>
                        Пароль:
                    <#else>
                        Password:
                    </#if> </label>
                <div class="col-sm-5">
                    <input type="password" name="password2"
                           class="form-control ${(password2Error??)?string('is-invalid','')}"
                           placeholder="Retype password">
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> <#if .locale = 'kz'>
                        Почта:
                    <#elseIf .locale = 'ru'>
                        Почта:
                    <#else>
                        Email:
                    </#if> </label>
                <div class="col-sm-5">
                    <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                           class="form-control ${(emailError??)?string('is-invalid','')}" placeholder="some@some.com">
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-lg-12 col-12 text-center mr-2">
                    <select class="selectpicker form-select" name="role" data-style="select-with-transition btn btn-primary">
                        <option value="student">
                            Student
                        </option>
                        <option value="teacher">
                            Teacher
                        </option>
                    </select>
                </div>
            </div>

            <#--<div class="form-group row-sm-auto">-->
                <#--<div class="g-recaptcha" data-sitekey = "6Ld3v2IaAAAAAMxl7Q71_FKxuYIvNbJeaRoMRm55"></div>-->
                <#--<#if captchaError??>-->
                    <#--<div class="alert alert-danger" role="alert">-->
                        <#--${captchaError}-->
                    <#--</div>-->
                <#--</#if>-->
            <#--</div>-->
        </#if>
        <div class="form-group row-sm-auto">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else><#if .locale = 'kz'>
                    Кіру
                <#elseIf .locale = 'ru'>
                    Войти
                <#else>
                    Sign in
                </#if></#if></button>
        </div>
        <div class="form-group row-sm--auto">
            <#if !isRegisterForm><a href="/registration"><#if .locale = 'kz'>
                Аккаунтты Ашу
            <#elseIf .locale = 'ru'>
                Создать Аккаунт
            <#else>
                Create Account
            </#if></a></#if>
        </div>
    </form>
</#macro>

<#macro logout isUser>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary btn-sm mr-4"  type="submit"><#if isUser><#if .locale = 'kz'>
                Шыгу
            <#elseIf .locale = 'ru'>
                Выйти
            <#else>
                Log out
            </#if><#else><#if .locale = 'kz'>
                Кіру
            <#elseIf .locale = 'ru'>
                Войти
            <#else>
                Log in
            </#if></#if></button>
    </form>
</#macro>