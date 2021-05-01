<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<div class="container mt-5">
    ${message?ifExists}
    <@l.login "/registration" true/>
</div>
</@c.page>