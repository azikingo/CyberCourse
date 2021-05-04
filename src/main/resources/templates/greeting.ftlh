<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
<div class="container mt-5">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <#list courses as course>
                <div class="carousel-item ${(course.id == 1)?then("active", "")}">
                    <img class="d-block w-100" src="/img/${course.photoPath!''}" alt="Course Image">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>${course.titleKz!''}</h5>
                        <p>${course.descriptionKz!''}</p>
                    </div>
                </div>
            </#list>
<#--            <div class="carousel-item active">-->
<#--                <img class="d-block w-100" src="..." alt="First slide">-->
<#--            </div>-->
<#--            <div class="carousel-item">-->
<#--                <img class="d-block w-100" src="..." alt="Second slide">-->
<#--            </div>-->
<#--            <div class="carousel-item">-->
<#--                <img class="d-block w-100" src="..." alt="Third slide">-->
<#--            </div>-->
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
<#--    <div class="jumbotron">-->
<#--        <i class="fas fa-fire fa-7x"></i>-->
<#--        <h1 class="display-4">Welcome to Fiery, <#if user??>${name}<#else>guest</#if></h1>-->
<#--        <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>-->
<#--        <hr class="my-4">-->
<#--        <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>-->
<#--        <p class="lead">-->
<#--            <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>-->
<#--        </p>-->
<#--    </div>-->
</div>
</@c.page>