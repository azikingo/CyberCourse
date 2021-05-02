    <#import "../parts/common.ftlh" as c>
    <@c.page>
<div class="container mt-5">
    <#if url?contains("/student/course/")>
        <div class="flex">
            <img class="card-img-top" src="/img/${course.photoPath!''}"
                 style="width: 100%; height: 300px" alt="Course photo">
            <div>
                <h1><em>${course.titleKz!''}</em></h1>
                <#list course.categories as category>
                    <em>${category.titleKz!''}<#sep>, </#sep></em>
                </#list>
                <h5>${course.descriptionKz!''}</h5>
                <h4><em>${course.price!''} kzt</em></h4>
                <p>Course duration: <em>${course.duration!'4'} h</em></p>
                <p>Course limit: <em>${course.limitTime!'5 '} w</em></p>
                <a href="${url}/subscribe" class="btn btn-primary">Тіркелу</a>
            </div>
            <div>
                <h4><em>Course parts</em></h4>
                <#list course.courseParts as coursePart>
                    <p>${coursePart.titleKz!''} : <em>${coursePart.duration?c} h</em></p>
                </#list>
            </div>
        </div>
    <#elseif url?contains("/student/course")>
        <div class="d-flex justify-content-center">
            <#list courses as course>
                <div class="card m-4" style="width: 18rem;">
                    <img class="card-img-top" src="/img/${course.photoPath!''}" alt="Course photo">
                    <div class="card-body">
                        <h5 class="card-title">${course.titleKz!''}</h5>
                        <p class="card-text">${course.descriptionKz!''}</p>
                        <em class="card-text">${course.price!''} kzt</em>
                    </div>
                    <div class="card-footer">
                        <a href="${url}/${course.id?c}" class="btn btn-primary">Толығырақ</a>
                    </div>
                </div>
            <#else>
                Курс жоқ
            </#list>
            <div class="card m-4" style="width: 18rem;">
                <img class="card-img-top" src="..." alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
            <div class="card m-4" style="width: 18rem;">
                <img class="card-img-top" src="..." alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
    <#else>
        -
    </#if>
</div>
</@c.page>