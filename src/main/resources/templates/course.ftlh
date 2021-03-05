<#import "parts/common.ftlh" as c>
<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" class="form-control" name="filter" value="${filter?ifExists}" placeholder="Search course">
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</div>
<div class="form-row">
    <#include "parts/courseAdd.ftlh"/>
    <#include "parts/courseCategoryAdd.ftlh"/>
</div>
<#include "parts/courseList.ftlh"/>
</@c.page>