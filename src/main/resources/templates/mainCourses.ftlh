<#import "parts/common.ftlh" as c>
<#import "parts/pager.ftlh" as p>
<#import "/spring.ftl" as spring/>
<#include "parts/security.ftlh">

<@c.page>
<div class="py-4" style="background: aliceblue">
    <div class="container">
        <#if url == "/course">
            <div class="row">
                <div class="col-lg-12 col-12 my-5">
                    <form method="get" action="${url}" class="form-inline">
                        <input type="text" class="col-lg-3 col-3 form-control" name="filter" value="${filter?ifExists}" placeholder="Search course">
                        <div class="col-lg-5 col-5">
                            <select class="selectpicker form-select" name="selectedCategory" data-style="select-with-transition btn btn-primary" data-live-search="true">
                                <option value="0" <#if !(selectedCategory??)>${'selected'}</#if>>...</option>
                                <#list categories as category>
                                    <option value="${category.id}" <#if selectedCategory??>${(category.id==selectedCategory.id)?then("selected", "")}</#if>>
                                        ${category.titleKz!''}
                                    </option>
                                </#list>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary ml-1"><#if .locale = 'kz'>
                                Іздеу
                            <#elseIf .locale = 'ru'>
                                Пойск
                            <#else>
                                Search
                            </#if></button>
                    </form>
                </div>
            </div>
            <div class="row">
                <@p.pager url courses />
                    <div class="card-columns">
                        <#list courses.content as course>
                            <div class="card m-4" style="width: 18rem;">
                                <img class="card-img-top" src="/img/${course.photoPath!''}" alt="Course photo">
                                <div class="card-body">
                                    <h5 class="card-title">${course.titleKz!''}</h5>
                                    <p class="card-text">${course.descriptionKz!''}</p>
                                    <em class="card-text">${course.price!''} kzt</em>
                                </div>
                                <div class="card-footer">
                                    <a href="${url}/${course.id?c}" class="btn btn-primary"><#if .locale = 'kz'>
                                            Толығырақ
                                        <#elseIf .locale = 'ru'>
                                         Подробнее
                                        <#else>
                                            Read More
                                        </#if></a>
                                </div>
                            </div>
                        <#else>
                            <#if .locale = 'kz'>
                               Курс Тіркелмеген
                            <#elseIf .locale = 'ru'>
                                Курс не зарегестрирован
                            <#else>
                                Course not registered
                            </#if>
                        </#list>
                    </div>
                <@p.pager url courses />
            </div>
        <#elseIf url?contains("/course/")>
            <div class="row">
                <div class="col-lg-12 col-12 my-5">
                    <img class="card-img-top" src="/img/${course.photoPath!''}"
                         style="width: 100%; height: 350px" alt="Course photo">
                </div>
                <div class="col-lg-12 col-12 my-3 text-center">
                    <h1><em>${course.titleKz!''}</em></h1>
                </div>
                <div class="col-lg-12 col-12 my-3 text-center">
                    <h5>${course.descriptionKz!''}</h5>
                </div>
                <div class="col-lg-12 col-12 my-3">
                    <#list course.categories as category>
                        <a href="/course?selectedCategory=${category.id?c}"><em>${category.titleKz!''}<#sep>, </#sep></em></a>
                    </#list>
                </div>
                <div class="col-lg-10 col-10 text-right my-3">
                    <h3><em>${course.price!''} kzt</em></h3>
                </div>
                <div class="col-lg-2 col-2 text-right my-3">
<#--                    <#if isStudent>-->
                        <a href="/student/my-courses/${course.id?c}/sub" class="btn btn-primary">
                            <#if .locale = 'kz'>
                                Тіркелу
                            <#elseIf .locale = 'ru'>
                                Подписаться
                            <#else>
                                Subscribe
                            </#if>
                        </a>
<#--                    </#if>-->
                </div>
                <div class="col-lg-12 col-12">
                    <p>Course duration: <em>${course.duration!'4h'}</em></p>
                </div>
                <div class="col-lg-12 col-12">
                    <p>Course limit: <em>${course.limitTime!'5w'}</em></p>
                </div>
                <div class="col-lg-12 col-12 mt-3">
                    <hr class="m-0" style="opacity: 80%">
                </div>
<#------------------------------------ Course parts ---------------------------------------->
                <div class="col-lg-12 col-12 text-center my-5">
                    <h4> <#if .locale = 'kz'>
                            Курс бағдарламасы: сіз үйренесіз
                        <#elseIf .locale = 'ru'>
                            Программа курса:Вы изучите
                        <#else>
                            Course program:You will learn
                        </#if></h4>
                </div>
                <#assign num = 0>
                <#list course.courseParts as coursePart>
                    <#assign num += 1>
                    <div class="col-lg-2 col-2 text-center">
                        <h5>Part</h5>
                        <h1>${num}</h1>
                    </div>
                    <div class="col-lg-10 col-10">
                        <p><i class="far fa-clock text-warning"></i>
                            <#if .locale = 'kz'>
                                Аяқтауға 1 сағат
                            <#elseIf .locale = 'ru'>
                                1ч на завершение
                            <#else>
                                1h to complete
                            </#if></p>
                        <h4>Part ${num}: ${coursePart.titleKz!''}</h4>
                        <h5>${coursePart.descriptionKz!''}</h5>
                    </div>
                    <div class="col-lg-2 col-2 my-4">
                    </div>
                    <#sep>
                        <div class="col-lg-10 col-10 my-4">
                            <hr class="m-0" style="opacity: 80%">
                        </div>
                    </#sep>
                </#list>
                <div class="col-lg-12 col-12 mt-3">
                    <hr class="m-0" style="opacity: 80%">
                </div>
            </div>
<#------------------------------------ Course review ---------------------------------------->
                <div class="col-lg-12 col-12 my-5">
                    <h1><b>4.1</b></h1>
                    <h3>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star"></span>
                    </h3>
                    <small style="margin-left: 3em">
                        <#if .locale = 'kz'>
                            2 119 бағалау
                        <#elseIf .locale = 'ru'>
                            2 119 оценки
                        <#else>
                            2 119 ratings
                        </#if></small>
                </div>
                <div class="col-lg-12 col-12 my-4">
                    <hr class="m-0" style="opacity: 80%">
                </div>

                <div class="col-lg-6 col-6 my-2">
                    <small>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                    </small>
                    <p>
                        <#if .locale = 'kz'>
                            Автор:
                        <#elseIf .locale = 'ru'>
                            Автор:
                        <#else>
                            Author:
                        </#if> <b>
                            <#if .locale = 'kz'>
                                Арман
                            <#elseIf .locale = 'ru'>
                                Арман
                            <#else>
                               Arman
                            </#if>
                        </b>
                        <#if .locale = 'kz'>
                            • МАМЫР 7-ШІ 2021
                        <#elseIf .locale = 'ru'>
                            • МАЙ 7-ГО 2021
                        <#else>
                            • MAY 7, 2021
                        </#if></p>
                    <p>
                        <#if .locale = 'kz'>
                            Қызықты және қызықты тақырып. Бұл курс бізге таулардың қоршаған орта үшін маңыздылығы мен олардың адам ретіндегі өміріміз үшін құндылығы туралы керемет шолу жасайды. Осы керемет курс үшін рахмет.
                        <#elseIf .locale = 'ru'>
                            Занимательная и интересная тема. Этот курс дает нам прекрасный обзор важности гор для нашей окружающей среды и их ценности для нашей жизни как человека. Спасибо вам за этот невероятный курс
                        <#else>
                            Entertaining and interesting subject. This course gives us a perfect overview of mountains' importance on our environment and their value to our lives as a human. Thank you for this incredible course.
                        </#if></p>
                </div>
                <div class="col-lg-6 col-6 my-2">
                    <small>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                    </small>
                    <p><#if .locale = 'kz'>
                            Автор:
                        <#elseIf .locale = 'ru'>
                            Автор:
                        <#else>
                            Author:
                        </#if> <b>Doszhan</b>
                        <#if .locale = 'kz'>
                            • МАМЫР 7-ШІ 2021
                        <#elseIf .locale = 'ru'>
                            • МАЙ 7-ГО 2021
                        <#else>
                            • MAY 7, 2021
                        </#if></p>
                    <p>
                        <#if .locale = 'kz'>
                            Сондықтан қызықты! Жақсы жасалды, әр сабақ ойластырылған, таулардың интерактивті картасы Әр уақытта аяқталуға қуанышты болды! Тауларға қатысты барлық нәрсеге керемет ойластырылған және сезімтал.
                        <#elseIf .locale = 'ru'>
                            Так интересно! Так хорошо сделано, каждый урок продуман, интерактивная карта гор была радостью, чтобы завершить каждый раз! Невероятно вдумчивый и чуткий ко всему, что касается гор.
                        <#else>
                            So interesting! So well made, every lesson is thought out the interactive mountain map was a joy to complete each time! Incredibly thoughtful and sensitive to every aspect that touches the mountains.
                        </#if>
                    </p>
                </div>
                <div class="col-lg-6 col-6 my-2">
                    <small>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                    </small>
                    <p>
                        <#if .locale = 'kz'>
                            Автор:
                        <#elseIf .locale = 'ru'>
                            Автор:
                        <#else>
                            Author:
                        </#if> <b>Zhomart</b>
                        <#if .locale = 'kz'>
                            • МАМЫР 5-ШІ 2021
                        <#elseIf .locale = 'ru'>
                            • МАЙ 5-ГО 2021
                        <#else>
                            • MAY 5, 2021
                        </#if></p>
                    <p> <#if .locale = 'kz'>
                            Өте білімді, жан-жақты, әдемі және қызықты бейнелер жиынтығы. Бұл сізді осы жерлерге баруға және қорғауға мәжбүр етеді деп үміттенемін.
                        <#elseIf .locale = 'ru'>
                            Невероятно хорошо созданный набор видеороликов, которые являются очень образовательными, всесторонними, красивыми и интересными. Я надеюсь, что это заставит вас захотеть посетить и защитить эти места, как это было со мной.
                        <#else>
                            Incredibly well-produced set of videos that are highly educational, well-rounded, beautiful, and interesting. I hope it leaves you wanting to both visit and protect these places, as it did for me.
                        </#if></p>
                </div>
                <div class="col-lg-6 col-6 my-2">
                    <small>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                        <span class="fa fa-star" style="color: orange"></span>
                    </small>
                    <p>
                        <#if .locale = 'kz'>
                            Автор:
                        <#elseIf .locale = 'ru'>
                            Автор:
                        <#else>
                            Author:
                        </#if>  <b>Quralai</b> <#if .locale = 'kz'>
                            • МАМЫР 4-ШІ 2021
                        <#elseIf .locale = 'ru'>
                            • МАЙ 4-ГО 2021
                        <#else>
                            • MAY 4, 2021
                        </#if></p>
                    <p>
                        <#if .locale = 'kz'>
                            Қызықты және қызықты тақырып. Бұл курс бізге таулардың қоршаған орта үшін маңыздылығы мен олардың адам ретіндегі өміріміз үшін құндылығы туралы керемет шолу жасайды. Осы керемет курс үшін рахмет.
                        <#elseIf .locale = 'ru'>
                            Занимательная и интересная тема. Этот курс дает нам прекрасный обзор важности гор для нашей окружающей среды и их ценности для нашей жизни как человека. Спасибо вам за этот невероятный курс.
                        <#else>
                            Entertaining and interesting subject. This course gives us a perfect overview of mountains' importance on our environment and their value to our lives as a human. Thank you for this incredible course.
                        </#if>
                    </p>
                </div>
                <div class="col-lg-12 col-12 my-4">
                    <hr class="m-0" style="opacity: 80%">
                </div>

                <div class="col-lg-12 col-12 my-4">
                    <h4>
                        <#if .locale = 'kz'>
                            Мұғалімдер
                        <#elseIf .locale = 'ru'>
                            Учителя
                        <#else>
                           Teachers
                        </#if>
                    </h4>
                </div>
                <div class="col-lg-2 col-2 my-4">
                    <img class="rounded-circle z-depth-2" style="width: 8em;height: 8em;" alt="100x100" src="https://www.young-enterprise.org.uk/wp-content/uploads/2019/01/iStock-975814072-edited-aspect-ratio-1x1-4.jpg"
                         data-holder-rendered="true">
                </div>
                <div class="col-lg-4 col-4 my-5">
                    <h5>
                        <#if .locale = 'kz'>
                            Ноғай Нұрсұлтан
                        <#elseIf .locale = 'ru'>
                            Ногай Нурсултан
                        <#else>
                           Nogay Nursultan
                        </#if>
                    </h5>
                    <h6>Toksik</h6>
                    <p>
                        <#if .locale = 'kz'>
                            КСГО курстары
                        <#elseIf .locale = 'ru'>
                            КСГО курсы
                        <#else>
                            CSGO courses
                        </#if>
                    </p>
                </div>
                <div class="col-lg-2 col-2 my-4">
                    <img class="rounded-circle z-depth-2" style="width: 8em;height: 8em;" alt="100x100" src="https://www.abc.net.au/cm/rimage/12257292-1x1-xlarge.jpg?v=3"
                         data-holder-rendered="true">
                </div>
                <div class="col-lg-4 col-4 my-5">
                    <h5>
                        <#if .locale = 'kz'>
                            Нағашыбаев Жансұлтан
                        <#elseIf .locale = 'ru'>
                            Нагашыбаев Жансултан
                        <#else>
                            Nagashybaev Zhansultan
                        </#if>
                    </h5>
                    <h6>
                        <#if .locale = 'kz'>
                            Стратег
                        <#elseIf .locale = 'ru'>
                            Стратег
                        <#else>
                            strategist
                        </#if>
                    </h6>
                    <p>
                        <#if .locale = 'kz'>
                            Brawl Stars курстары
                        <#elseIf .locale = 'ru'>
                            Курсы по Brawl stars
                        <#else>
                           Brawl stars courses
                        </#if>
                    </p>
                </div>

        </#if>
    </div>
</div>
<#include "parts/footer.ftlh">
</@c.page>