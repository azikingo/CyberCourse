<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="https://cq-esports.com/storage/uploads/posts/989042/comment-sqkxqwdpsl2jd8hdsgip2t1fdhwckagr.jpg" alt="First slide">
            <div class="carousel-caption d-none d-md-block">
                <h5><#if .locale = 'kz'>
                       Dota 2 чемпиондары
                    <#elseIf .locale = 'ru'>
                        Чемпионы по Dota 2
                    <#else>
                       Dota 2 champions
                    </#if></h5>
                <p><#if .locale = 'kz'>
                        Мұнда тек ең жақсылары жаттығады
                    <#elseIf .locale = 'ru'>
                        Тут тренируются только лучшие
                    <#else>
                        Only the best train here
                    </#if></p>
            </div>
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="https://static.hltv.org/images/galleries/11362-full/1526856561.097.jpeg" alt="Second slide">
            <div class="carousel-caption d-none d-md-block">
                <h5><#if .locale = 'kz'>
                        CS:GO чемпиондары
                    <#elseIf .locale = 'ru'>
                        Чемпионы по CS:GO
                    <#else>
                       CS:GO champions
                    </#if></h5>
                <p><#if .locale = 'kz'>
                        Мұнда тек ең жақсылары жаттығады
                    <#elseIf .locale = 'ru'>
                        Тут тренируются только лучшие
                    <#else>
                        Only the best train here
                    </#if></p>
            </div>
        </div>
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
<#if isStudent>
    <div class="col-lg-12 col-12" style="background: aliceblue">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12 col-12 mt-5"><h4>
                        <#if .locale = 'kz'>
                            Менің соңғы әрекеттерім
                        <#elseIf .locale = 'ru'>
                            Мои недавние действия
                        <#else>
                            My last actions
                        </#if>
                    </h4></div>
                <div class="col-lg-12 col-12 m-2"><p style="margin-left: 5px">
                        <#if .locale = 'kz'>
                            БІТІРІЛМЕГЕН КУРСТАР
                        <#elseIf .locale = 'ru'>
                            НЕОКОНЧЕННЫЕ КУРСЫ
                        <#else>
                            INCOMPLETE COURSES
                        </#if>
                    </p></div>
                <div class="shadow p-3 mb-5 bg-white rounded">
                    <div class="row">
                        <div class="col-lg-2 col-2">
                            <img class="d-block w-100" src="/img/6eace311-0eeb-4730-b0a9-8b0dfa569568.CSGO.jpg" alt="Course Image">
                        </div>
                        <div class="col-lg-8 col-8">
                            <div class="col-lg-12 col-12"><p class="font-weight-bold m-0">CS GO</p></div>
                            <div class="col-lg-12 col-12"><small class="font-italic"><#if .locale = 'kz'>
                                        Мұғалім Азамат
                                    <#elseIf .locale = 'ru'>
                                        Учитель Азамат
                                    <#else>
                                       Teacher Azamat
                                    </#if></small></div>
                            <div class="col-lg-12 col-12 mt-2"><small class="font-weight-bold"><#if .locale = 'kz'>
                                        Прогресс
                                    <#elseIf .locale = 'ru'>
                                        Прогресс
                                    <#else>
                                        Progress
                                    </#if></small></div>
                            <div class="col-lg-12 col-12">
                                <div class="progress">
                                    <#assign passed = 60>
                                    <div class="progress-bar progress-bar-striped progress-bar-animated
                                                ${(passed>74)?then('bg-success', (passed>50)?string('bg-warning', 'bg-danger'))}"
                                         role="progressbar" aria-valuenow="${passed}" aria-valuemin="0"
                                         aria-valuemax="100" style="width: ${(passed > 0)?then(passed?replace(",","."), 0.5)}%">
                                        ${passed?string("0.#")}%
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-2 text-center">
                            <div class="col-lg-12 col-12 mt-4"><small class="font-weight-bold"><#if .locale = 'kz'>
                                        4-ші апта
                                    <#elseIf .locale = 'ru'>
                                       4 недели
                                    <#else>
                                        4 week
                                    </#if></small></div>
                            <a href="/student/my-courses" class="btn btn-primary"><#if .locale = 'kz'>
                                    Жалғастыру
                                <#elseIf .locale = 'ru'>
                                    Продолжить
                                <#else>
                                    Continue
                                </#if></a>
                        </div>
                        <div class="col-lg-2 col-2">
                        </div>
                        <div class="col-lg-10 col-10 mt-3">
                            <hr class="m-0" style="opacity: 50%">
                        </div>
                    </div>
                </div>
                <div class="shadow p-3 mb-5 bg-white rounded">
                    <div class="row">
                        <div class="col-lg-2 col-2">
                            <img class="d-block w-100" src="/img/d7b9ec22-fcd5-41e9-9b0a-1e192832e95d.dota-2-header.jpg" alt="Course Image">
                        </div>
                        <div class="col-lg-8 col-8">
                            <div class="col-lg-12 col-12"><p class="font-weight-bold m-0">Dota</p></div>
                            <div class="col-lg-12 col-12"><small class="font-italic"><#if .locale = 'kz'>
                                        Мұғалім Нұрдәулет
                                    <#elseIf .locale = 'ru'>
                                        Учитель Нурдаулет
                                    <#else>
                                        Teacher Nurdaulet
                                    </#if></small></div>
                            <div class="col-lg-12 col-12 mt-2"><small class="font-weight-bold"><#if .locale = 'kz'>
                                        Прогресс
                                    <#elseIf .locale = 'ru'>
                                        Прогресс
                                    <#else>
                                        Progress
                                    </#if></small></div>
                            <div class="col-lg-12 col-12">
                                <div class="progress">
                                    <#assign passed = 35>
                                    <div class="progress-bar progress-bar-striped progress-bar-animated
                                                ${(passed>74)?then('bg-success', (passed>50)?string('bg-warning', 'bg-danger'))}"
                                         role="progressbar" aria-valuenow="${passed}" aria-valuemin="0"
                                         aria-valuemax="100" style="width: ${(passed > 0)?then(passed?replace(",","."), 0.5)}%">
                                        ${passed?string("0.#")}%
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-2 text-center">
                            <div class="col-lg-12 col-12 mt-4"><small class="font-weight-bold"><#if .locale = 'kz'>
                                        6-шы апта
                                    <#elseIf .locale = 'ru'>
                                        6ая неделя
                                    <#else>
                                        6 week
                                    </#if></small></div>
                            <a href="/student/my-courses" class="btn btn-primary"><#if .locale = 'kz'>
                                    Жалғастыру
                                <#elseIf .locale = 'ru'>
                                    Продолжить
                                <#else>
                                    Continue
                                </#if></a>
                        </div>
                        <div class="col-lg-2 col-2">
                        </div>
                        <div class="col-lg-10 col-10 mt-3">
                            <hr class="m-0" style="opacity: 50%">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</#if>
<div class="col-lg-12 col-12">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-12 col-12 mt-5"><h4><#if .locale = 'kz'>
                        Fiery ұсыныстары
                    <#elseIf .locale = 'ru'>
                        Рекомендации от Fiery
                    <#else>
                        Recommendations from Fiery
                    </#if></h4></div>
            <div class="col-lg-12 col-12 m-2"><p style="margin-left: 5px"><#if .locale = 'kz'>
                        Кәсіби ойыншы болу үшін арнайы таңдалған курстардан дұрыс таңдаңыз!
                <#elseIf .locale = 'ru'>
                    Выберите правильные из специально отобранных курсов, чтобы стать профессиональным геймером!
                <#else>
                        Choose the right ones from the specially selected courses to be profi gamer!
                    </#if></p></div>

            <div class="col-lg-12 col-12" style="margin-top: 5em"><h4><#if .locale = 'kz'>
                        Cтратегия
                <#elseIf .locale = 'ru'>
                   Стратегия
                <#else>
                    Strategy
                    </#if></h4></div>
            <div class="card-deck">
                <div class="card">
                    <img class="card-img-top" src="img/d7b9ec22-fcd5-41e9-9b0a-1e192832e95d.dota-2-header.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">Dota</h5>
                        <p class="card-text"><#if .locale = 'kz'>
                            Дота сипаттамасы
                        <#elseIf .locale = 'ru'>
                            Описание Доты
                        <#else>
                                Dota description
                            </#if></p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted"><#if .locale = 'kz'>
                                        3 ай бұрын жасалған
                                <#elseIf .locale = 'ru'>
                                    Создано 3 мес назад
                                <#else>
                                        Created 3 months ago
                                    </#if></small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm"><#if .locale = 'kz'>
                                        Тіркелу
                                <#elseIf .locale = 'ru'>
                                    Записаться
                                <#else>
                                        Register
                                    </#if></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/6eace311-0eeb-4730-b0a9-8b0dfa569568.CSGO.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">CS</h5>
                        <p class="card-text"><#if .locale = 'kz'>
                            КС сипаттамасы
                        <#elseIf .locale = 'ru'>
                            Описание КС
                        <#else>
                            CS description
                            </#if></p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted"><#if .locale = 'kz'>
                                   2 ай бұрын жасалған
                                <#elseIf .locale = 'ru'>
                                   Создано 2 мес назад
                                <#else>
                                        Created 2 months ago
                                    </#if></small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm"><#if .locale = 'kz'>
                                        Тіркелу
                                <#elseIf .locale = 'ru'>
                                    Записаться
                                <#else>
                                    Register
                                    </#if></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/a0b04aaf-f408-4b32-bee2-93bd51de057e.arctic-fox-animals-eyes-selective-wallpaper.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title"><#if .locale = 'kz'>
                                Overwatch
                        <#elseIf .locale = 'ru'>
                            Overwatch
                        <#else>
                            Overwatch
                            </#if></h5>
                        <p class="card-text"><#if .locale = 'kz'>
                            Overwatch сипаттамасы
                        <#elseIf .locale = 'ru'>
                            Описание Overwatch
                        <#else>
                            Overwatch description
                            </#if></p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted"><#if .locale = 'kz'>
                                    1 ай бұрын жасалған
                                <#elseIf .locale = 'ru'>
                                    Создано 1 мес назад
                                <#else>
                                        Created 1 month ago
                                    </#if></small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm"><#if .locale = 'kz'>
                                    Тіркелу
                                <#elseIf .locale = 'ru'>
                                    Записаться
                                <#else>
                                    Register
                                    </#if></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/6eace311-0eeb-4730-b0a9-8b0dfa569568.CSGO.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">CS</h5>
                        <p class="card-text"><#if .locale = 'kz'>
                                КС сипаттамасы
                            <#elseIf .locale = 'ru'>
                                Описание КС
                            <#else>
                                CS description
                            </#if></p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted"><#if .locale = 'kz'>
                                        2 ай бұрын жасалған
                                    <#elseIf .locale = 'ru'>
                                        Создано 2 мес назад
                                    <#else>
                                        Created 2 months ago
                                    </#if></small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm"><#if .locale = 'kz'>
                                        Тіркелу
                                <#elseIf .locale = 'ru'>
                                    Записаться
                                <#else>
                                    Register
                                    </#if></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-12 col-12" style="margin-top: 5em"><h4><#if .locale = 'kz'>
                        Атыс
                    <#elseIf .locale = 'ru'>
                        Стрелялки
                    <#else>
                        Shooter
                    </#if></h4></div>
            <div class="card-deck">
                <div class="card">
                    <img class="card-img-top" src="img/d7b9ec22-fcd5-41e9-9b0a-1e192832e95d.dota-2-header.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">Dota</h5>
                        <p class="card-text"><#if .locale = 'kz'>
                                Дота сипаттамасы
                            <#elseIf .locale = 'ru'>
                                Описание Доты
                            <#else>
                                Dota description
                            </#if></p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted"><#if .locale = 'kz'>
                                        3 ай бұрын жасалған
                                    <#elseIf .locale = 'ru'>
                                        Создано 3 мес назад
                                    <#else>
                                        Created 3 months ago
                                    </#if></small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm"><#if .locale = 'kz'>
                                        Тіркелу
                                    <#elseIf .locale = 'ru'>
                                        Записаться
                                    <#else>
                                        Register
                                    </#if></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/6eace311-0eeb-4730-b0a9-8b0dfa569568.CSGO.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">CS</h5>
                        <p class="card-text"><#if .locale = 'kz'>
                                КС сипаттамасы
                            <#elseIf .locale = 'ru'>
                                Описание КС
                            <#else>
                                CS description
                            </#if></p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted"><#if .locale = 'kz'>
                                        2 ай бұрын жасалған
                                    <#elseIf .locale = 'ru'>
                                        Создано 2 мес назад
                                    <#else>
                                        Created 2 months ago
                                    </#if></small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm"><#if .locale = 'kz'>
                                        Тіркелу
                                    <#elseIf .locale = 'ru'>
                                       Записаться
                                    <#else>
                                        Register
                                    </#if></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/a0b04aaf-f408-4b32-bee2-93bd51de057e.arctic-fox-animals-eyes-selective-wallpaper.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">Mortal Combat</h5>
                        <p class="card-text"><#if .locale = 'kz'>
                                МК сипаттамасы
                            <#elseIf .locale = 'ru'>
                                Описание МК
                            <#else>
                                MC description
                            </#if></p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted"><#if .locale = 'kz'>
                                        1 ай бұрын жасалған
                                    <#elseIf .locale = 'ru'>
                                        Создано 1 мес назад
                                    <#else>
                                        Created 1 month ago
                                    </#if></small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm">
                                    <#if .locale = 'kz'>
                                        Тіркелу
                                    <#elseIf .locale = 'ru'>
                                        Записаться
                                    <#else>
                                        Register
                                    </#if></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/6eace311-0eeb-4730-b0a9-8b0dfa569568.CSGO.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">CS</h5>
                        <p class="card-text"><#if .locale = 'kz'>
                                КС сипаттамасы
                            <#elseIf .locale = 'ru'>
                                Описание КС
                            <#else>
                                CS description
                            </#if>
                        </p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted">
                                    <#if .locale = 'kz'>
                                        2 ай бұрын жасалған
                                    <#elseIf .locale = 'ru'>
                                        Создано 2 мес назад
                                    <#else>
                                        Created 2 months ago
                                    </#if></small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm"><#if .locale = 'kz'>
                                        Тіркелу
                                    <#elseIf .locale = 'ru'>
                                        Записаться
                                    <#else>
                                        Register
                                    </#if></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 col-12 text-center" style="margin-top: 5em">
                <a href="/course" class="btn btn-primary btn-lg"><#if .locale = 'kz'>
                        Барлық курстарды қарау
                    <#elseIf .locale = 'ru'>
                        Посмотреть все курсы
                    <#else>
                        See all courses
                    </#if></a>
            </div>

        </div>
    </div>
</div>
<div class="col-lg-12 col-12 mt-5" style="background: aliceblue">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-12 col-12 mt-5"><h4><#if .locale = 'kz'>
                        Арнайы жеңілдіктер
                    <#elseIf .locale = 'ru'>
                        Специальные скидки
                    <#else>
                        Special discounts
                    </#if></h4></div>
            <div class="col-lg-12 col-12 m-2"><p style="margin-left: 5px">


                    <#if .locale = 'kz'>
                        Жеңілдіктерді жіберіп алмау үшін қазір жазылыңыз!
                    <#elseIf .locale = 'ru'>
                        Подпишитесь сейчас, чтобы не пропустить скидку!
                    <#else>
                        Subscribe now to not miss out on the discount!
                    </#if></p></div>

            <div class="col-lg-12 col-12" style="margin-top: 5em"><h4><#if .locale = 'kz'>
                        Ыстық жеңілдіктер
                    <#elseIf .locale = 'ru'>
                        Горячие скидки
                    <#else>
                        Hot discounts
                    </#if></h4></div>
            <div class="card-deck">
                <div class="card">
                    <img class="card-img-top" src="img/d7b9ec22-fcd5-41e9-9b0a-1e192832e95d.dota-2-header.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">Dota</h5>
                        <p class="card-text"><#if .locale = 'kz'>
                                Дота сипаттамасы
                            <#elseIf .locale = 'ru'>
                                Описание Доты
                            <#else>
                                Dota description
                            </#if></p>
                        <div class="row justify-content-center">
                            <p style="font-size: 20px"><del><i><#if .locale = 'kz'>
                                            4500тг
                                        <#elseIf .locale = 'ru'>
                                            4500тг
                                        <#else>
                                            4500kzt
                                        </#if></i></del>  <b><#if .locale = 'kz'>
                                        2250тг
                                    <#elseIf .locale = 'ru'>
                                        2250тг
                                    <#else>
                                        2250kzt
                                    </#if></b></p>
                            <img class="card-img-top ml-3" style="height: 35px; width: 35px" src="img/discount.png" alt="Course image">
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row justify-content-center">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted"><#if .locale = 'kz'>
                                        3 ай бұрын жасалған
                                    <#elseIf .locale = 'ru'>
                                        Создано 3 мес назад
                                    <#else>
                                        Created 3 months ago
                                    </#if>
                                </small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm"><#if .locale = 'kz'>
                                        Тіркелу
                                    <#elseIf .locale = 'ru'>
                                        Записаться
                                    <#else>
                                        Register
                                    </#if></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/6eace311-0eeb-4730-b0a9-8b0dfa569568.CSGO.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">CS</h5>
                        <p class="card-text"><#if .locale = 'kz'>
                                КС сипаттамасы
                            <#elseIf .locale = 'ru'>
                                Описание КС
                            <#else>
                               CS description
                            </#if>
                        </p>
                        <div class="row justify-content-center">
                            <p style="font-size: 20px"><del><i><#if .locale = 'kz'>
                                            6000тг
                                        <#elseIf .locale = 'ru'>
                                            6000тг
                                        <#else>
                                            6000kzt
                                        </#if></i></del>  <b><#if .locale = 'kz'>
                                        4200тг
                                    <#elseIf .locale = 'ru'>
                                        4200тг
                                    <#else>
                                        4200kzt
                                    </#if></b></p>
                            <img class="card-img-top ml-3" style="height: 35px; width: 35px" src="img/discount.png" alt="Course image">
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted"><#if .locale = 'kz'>
                                        2 ай бұрын жасалған
                                    <#elseIf .locale = 'ru'>
                                        Создано 2 мес назад
                                    <#else>
                                        Created 2 months ago
                                    </#if></small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm">
                                    <#if .locale = 'kz'>
                                        Тіркелу
                                    <#elseIf .locale = 'ru'>
                                        Записаться
                                    <#else>
                                        Register
                                    </#if></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/a0b04aaf-f408-4b32-bee2-93bd51de057e.arctic-fox-animals-eyes-selective-wallpaper.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">League of Legends</h5>
                        <p class="card-text"><#if .locale = 'kz'>
                                ЛОЛ сипаттамасы
                            <#elseIf .locale = 'ru'>
                                Описание Лола
                            <#else>
                                LoL description
                            </#if>
                        </p>
                        <div class="row justify-content-center">
                            <p style="font-size: 20px"><del><i><#if .locale = 'kz'>
                                            2500тг
                                        <#elseIf .locale = 'ru'>
                                            2500тг
                                        <#else>
                                            2500kzt
                                        </#if></i></del>  <b><#if .locale = 'kz'>
                                        1950тг
                                    <#elseIf .locale = 'ru'>
                                        1950тг
                                    <#else>
                                        1950kzt
                                    </#if></b></p>
                            <img class="card-img-top ml-3" style="height: 35px; width: 35px" src="img/discount.png" alt="Course image">
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted"><#if .locale = 'kz'>
                                        1 ай бұрын жасалған
                                    <#elseIf .locale = 'ru'>
                                        Создано 1 мес назад
                                    <#else>
                                        Created 1 month ago
                                    </#if>
                                </small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm"><#if .locale = 'kz'>
                                        Тіркелу
                                    <#elseIf .locale = 'ru'>
                                        Записаться
                                    <#else>
                                        Register
                                    </#if></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/6eace311-0eeb-4730-b0a9-8b0dfa569568.CSGO.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">CS</h5>
                        <p class="card-text"><#if .locale = 'kz'>
                                КС сипаттамасы
                            <#elseIf .locale = 'ru'>
                                Описание КС
                            <#else>
                                CS description
                            </#if></p>
                        <div class="row justify-content-center">
                            <p style="font-size: 20px"><del><i><#if .locale = 'kz'>
                                            6000тг
                                        <#elseIf .locale = 'ru'>
                                            6000тг
                                        <#else>
                                            6000kzt
                                        </#if></i></del>  <b><#if .locale = 'kz'>
                                        4200тг
                                    <#elseIf .locale = 'ru'>
                                        4200тг
                                    <#else>
                                        4200kzt
                                    </#if></b></p>
                            <img class="card-img-top ml-3" style="height: 35px; width: 35px" src="img/discount.png" alt="Course image">
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted"><#if .locale = 'kz'>
                                        2 ай бұрын жасалған
                                    <#elseIf .locale = 'ru'>
                                        Создано 2 мес назад
                                    <#else>
                                        Created 2 months ago
                                    </#if></small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm"><#if .locale = 'kz'>
                                        Тіркелу
                                    <#elseIf .locale = 'ru'>
                                        Записаться
                                    <#else>
                                        Register
                                    </#if></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 col-12 text-center mb-5" style="margin-top: 5em">
                <a href="/course" class="btn btn-primary btn-lg"><#if .locale = 'kz'>
                        Барлық курстарды қарау
                    <#elseIf .locale = 'ru'>
                        Посмотреть все курсы
                    <#else>
                        See all courses
                    </#if></a>
            </div>

        </div>
    </div>
</div>
<section class="mt-5 pt-5 pb-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-6"><h4><#if .locale = 'kz'>
                        Біздін мұғалімдер
                    <#elseIf .locale = 'ru'>
                        Наши учителя
                    <#else>
                        Our teachers
                    </#if></h4></div>
            <div class="col-6 text-right">
                <a class="btn btn-primary mb-3 mr-1" href="#carouselExampleIndicators2" role="button" data-slide="prev">
                    <i class="fa fa-arrow-left"></i>
                </a>
                <a class="btn btn-primary mb-3 " href="#carouselExampleIndicators2" role="button" data-slide="next">
                    <i class="fa fa-arrow-right"></i>
                </a>
            </div>
            <div class="col-lg-12 col-12 ml-2"><p style="margin-left: 5px"><#if .locale = 'kz'>
                        3 жылдан астам ойын тәжірибесі бар әртүрлі мұғалімдер
                    <#elseIf .locale = 'ru'>
                        разные учителя со стажем игры более 3 лет
                    <#else>
                        different teachers with more than 3 years of experience in the <game></game>
                    </#if></p></div>
            <div class="col-12 mt-5">
                <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">

                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row">

                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 1.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title"><#if .locale = 'kz'>
                                                    Жаппар Нудаулет
                                                <#elseIf .locale = 'ru'>
                                                    Жаппар Нурдаулет
                                                <#else>
                                                    Zhappar Nurdaulet
                                                </#if></h4>
                                            <p class="card-text"><#if .locale = 'kz'>
                                                    "Dota" Курс мұғалімі
                                                <#elseIf .locale = 'ru'>
                                                    Учитель курса "Dota"
                                                <#else>
                                                    "Dota" Course Teacher
                                                </#if></p>

                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 2.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title"><#if .locale = 'kz'>
                                                     Ноғай Нұрсултан
                                                <#elseIf .locale = 'ru'>
                                                    Ногай Нурсултан
                                                <#else>
                                                    Nogay Nursultan
                                                </#if></h4>
                                            <p class="card-text"><#if .locale = 'kz'>
                                                    "CS GO" Курс мұғалімі
                                                <#elseIf .locale = 'ru'>
                                                    Учитель курса "CS GO"
                                                <#else>
                                                    "CS GO" Course Teacher
                                                </#if></p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 3.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title"><#if .locale = 'kz'>
                                                    Жансултан Нағашыбаев
                                                <#elseIf .locale = 'ru'>
                                                    Жансултан Нагашыбаев
                                                <#else>
                                                    Zhansultan Nagashybayev
                                                </#if></h4>
                                            <p class="card-text"><#if .locale = 'kz'>
                                                    "CS GO" Курс мұғалімі
                                                <#elseIf .locale = 'ru'>
                                                    Учитель курса "CS GO"
                                                <#else>
                                                    "CS GO" Course Teacher
                                                </#if></p>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">

                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 2.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title">Nogay Nursultan</h4>
                                            <p class="card-text"><#if .locale = 'kz'>
                                                    "CS GO" Курс мұғалімі
                                                <#elseIf .locale = 'ru'>
                                                    Учитель курса "CS GO"
                                                <#else>
                                                    "CS GO" Course Teacher
                                                </#if></p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 3.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title"><#if .locale = 'kz'>
                                                    Александр Костылев
                                                <#elseIf .locale = 'ru'>
                                                    Александр Костылев
                                                <#else>
                                                    Oleksandr Kostylev
                                                </#if></h4>
                                            <p class="card-text"><#if .locale = 'kz'>
                                                    "CS GO" Курс мұғалімі
                                                <#elseIf .locale = 'ru'>
                                                    Учитель курса "CS GO"
                                                <#else>
                                                    "CS GO" Course Teacher
                                                </#if></p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 1.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title"><#if .locale = 'kz'>
                                                    Жаппар Нудаулет
                                                <#elseIf .locale = 'ru'>
                                                    Жаппар Нурдаулет
                                                <#else>
                                                    Zhappar Nurdaulet
                                                </#if></h4>
                                            <p class="card-text"><#if .locale = 'kz'>
                                                    "Dota 2" Курс мұғалімі
                                                <#elseIf .locale = 'ru'>
                                                    Учитель курса "Dota 2"
                                                <#else>
                                                    "Dota 2" Course Teacher
                                                </#if></p>

                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">

                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 3.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title"><#if .locale = 'kz'>
                                                    Александр Костылев
                                                <#elseIf .locale = 'ru'>
                                                    Александр Костылев
                                                <#else>
                                                    Oleksandr Kostylev
                                                </#if></h4>
                                            <p class="card-text"><#if .locale = 'kz'>
                                                    "CS GO" Курс мұғалімі
                                                <#elseIf .locale = 'ru'>
                                                    Учитель курса "CS GO"
                                                <#else>
                                                    "CS GO" Course Teacher
                                                </#if></p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 1.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title"><#if .locale = 'kz'>
                                                    Жаппар Нудаулет
                                                <#elseIf .locale = 'ru'>
                                                    Жаппар Нурдаулет
                                                <#else>
                                                    Zhappar Nurdaulet
                                                </#if></h4>
                                            <p class="card-text"><#if .locale = 'kz'>
                                                    "Dota 2" Курс мұғалімі
                                                <#elseIf .locale = 'ru'>
                                                    Учитель курса "Dota 2"
                                                <#else>
                                                    "Dota 2" Course Teacher
                                                </#if></p>

                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 2.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title"><#if .locale = 'kz'>
                                                    Ноғай Нұрсултан
                                                <#elseIf .locale = 'ru'>
                                                    Ногай Нурсултан
                                                <#else>
                                                    Nogay Nursultan
                                                </#if></h4>
                                            <p class="card-text"><#if .locale = 'kz'>
                                                    "CS GO" Курс мұғалімі
                                                <#elseIf .locale = 'ru'>
                                                    Учитель курса "CS GO"
                                                <#else>
                                                    "CS GO" Course Teacher
                                                </#if></p>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<#include "parts/footer.ftlh">
</@c.page>