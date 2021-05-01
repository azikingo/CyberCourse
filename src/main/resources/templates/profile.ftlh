<#import "parts/common.ftlh" as c>

<@c.page>
<div class="container mt-5">
    <h5>${username}</h5>
    ${message?ifExists}
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Current password : </label>
            <div class="col-sm-5">
                <input type="password" name="password" class="form-control" placeholder="Password">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> New password : </label>
            <div class="col-sm-5">
                <input type="password" name="password" class="form-control" placeholder="Password">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Repeat password : </label>
            <div class="col-sm-5">
                <input type="password" name="password" class="form-control" placeholder="Password">
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary mb-2" type="submit">Change password</button>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Email : </label>
            <div class="col-sm-5">
                <input type="email" disabled name="email" class="form-control" placeholder="some@some.com" value="${email!''}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> New email : </label>
            <div class="col-sm-5">
                <input type="email" name="email" class="form-control" placeholder="some@some.com">
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary mb-2" type="submit">Change email</button>
    </form>
</div>
</@c.page>