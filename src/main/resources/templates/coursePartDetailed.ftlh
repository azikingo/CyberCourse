    <#import "parts/common.ftlh" as c>
    <@c.page>
<div class="row">
<div class="col-3">
    <ul class="list-group m-5">
        <div id="accordion" style="width: 20%; position: fixed">
            <div class="list-group">
                <div id="areaOne">
                    <a href="#" class="list-group-item list-group-item-action"
                       data-toggle="collapse" data-target="#menuOne" aria-expanded="true" aria-controls="menuOne">
                        Course
                    </a>
                </div>
                <div id="menuOne" class="collapse" aria-labelledby="areaOne" data-parent="#accordion">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <a href="/admin/course" style="text-decoration: none; margin: 1em">Courses</a>
                        </li>
                        <li class="list-group-item">
                            <a href="/admin/course/addCourse" style="text-decoration: none; margin: 1em">Add new course</a>
                        </li>
                    </ul>
                </div>
                <div id="areaTwo">
                    <a href="#" class="list-group-item list-group-item-action"
                       data-toggle="collapse" data-target="#menuTwo" aria-expanded="true" aria-controls="menuTwo">
                        Course part
                    </a>
                </div>
                <div id="menuTwo" class="collapse" aria-labelledby="areaTwo" data-parent="#accordion">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <a href="/admin/course/${course.id?c}/parts" style="text-decoration: none; margin: 1em">Course parts</a>
                        </li>
                        <li class="list-group-item">
                            <a href="/admin/course/${course.id?c}/addPart" style="text-decoration: none; margin: 1em">Add new course part</a>
                        </li>
                    </ul>
                </div>
                <div id="areaFour">
                    <a href="/admin/course/${course.id?c}/parts/${coursePart.id?c}/quiz" class="list-group-item list-group-item-action">
                        Course part quiz
                    </a>
                </div>
<#--                <div id="menuFour" class="collapse" aria-labelledby="areaFour" data-parent="#accordion">-->
<#--                    <ul class="list-group list-group-flush">-->
<#--                        <li class="list-group-item">-->
<#--                            <a href="/" style="text-decoration: none; margin: 1em">Quizes</a>-->
<#--                        </li>-->
<#--                        <li class="list-group-item">-->
<#--                            <a href="/" style="text-decoration: none; margin: 1em">Add new quiz</a>-->
<#--                        </li>-->
<#--                    </ul>-->
<#--                </div>-->
            </div>
        </div>
    </ul>
</div>
<div class="col-9">
    <div class="container mt-5">
        <#if url?contains("/quiz")>
            <#if quiz??>
            <#else>
                <a class="btn btn-primary" href="/admin/course/${course.id?c}/parts/${coursePart.id?c}/addQuiz" role="button">Add quiz</a>
            </#if>
        <#elseif url?contains("/parts/")>
            <div class="row">
                <div>
                    <h2><em>${coursePart.titleKz!''}</em></h2>
                    <p>${coursePart.descriptionKz!''}</p>
                    <p>Duration: <em>${coursePart.duration!''} h</em></p>
                    <p>Limit time: <em>${coursePart.limitTime!''} w</em></p>
                    <iframe width="720" height="450" src="${coursePart.videoLink!''}">
                    </iframe>
                </div>
            </div>
        <#else>
            -
        </#if>
    </div>
</div>
</@c.page>