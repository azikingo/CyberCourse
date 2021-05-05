<#include "security.ftlh">
<#import "login.ftlh" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <a class="navbar-brand" href="/">
        <img src="https://i.ibb.co/3Y0PLd1/116853-128-3.png" width="40" height="40" class="d-inline-block align-top" alt="">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
<#--            <#if isAdmin>-->
<#--            <li class="nav-item">-->
<#--                <a class="nav-link" href="/user">User list</a>-->
<#--            </li>-->
<#--            </#if>-->
            <#if user?? && name != "unknown">
            <li class="nav-item">
                <a class="nav-link" href="/course">Courses</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${isStudent?then("/student","")}/my-courses">My courses</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/profile">Profile</a>
            </li>
            </#if>
            <li class="nav-item">
                <a class="nav-link" href="/contacts">Contacts</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/about">About</a>
            </li>
        </ul>

        <div class="navbar-text mr-3"><#if user?? && name != "unknown">${name}<#else>Please, login</#if></div>
        <@l.logout user??/>
    </div>
</nav>