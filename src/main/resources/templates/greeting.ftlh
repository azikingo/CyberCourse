<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
<i class="fas fa-fire fa-7x"></i>
    <h5>Hello, <#if user??>${name}<#else>guest</#if></h5>
    <div>Welcome to Fiery</div>
</@c.page>