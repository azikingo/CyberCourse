<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>

    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="https://cq-esports.com/storage/uploads/posts/989042/comment-sqkxqwdpsl2jd8hdsgip2t1fdhwckagr.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="https://static.hltv.org/images/galleries/11362-full/1526856561.097.jpeg" alt="Second slide">
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
            <div class="col-lg-12 col-12 m-2"><p style="margin-left: 5px">INCOMPLETE COURSES</p></div>
            <div class="shadow p-3 mb-5 bg-white rounded">
                <div class="row">
                    <div class="col-lg-2 col-2">
                        <img class="d-block w-100" src="/img/6eace311-0eeb-4730-b0a9-8b0dfa569568.CSGO.jpg" alt="Course Image">
                    </div>
                    <div class="col-lg-8 col-8">
                        <div class="col-lg-12 col-12"><p class="font-weight-bold m-0">CS GO</p></div>
                        <div class="col-lg-12 col-12"><small class="font-italic">Teacher Azamat</small></div>
                        <div class="col-lg-12 col-12 mt-2"><small class="font-weight-bold">Progress</small></div>
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
                        <div class="col-lg-12 col-12 mt-4"><small class="font-weight-bold">4 week</small></div>
                        <a href="/student/my-courses" class="btn btn-primary">Continue</a>
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
                        <div class="col-lg-12 col-12"><small class="font-italic">Teacher Nurdaulet</small></div>
                        <div class="col-lg-12 col-12 mt-2"><small class="font-weight-bold">Progress</small></div>
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
                        <div class="col-lg-12 col-12 mt-4"><small class="font-weight-bold">6 week</small></div>
                        <a href="/student/my-courses" class="btn btn-primary">Continue</a>
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
<div class="col-lg-12 col-12">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-12 col-12 mt-5"><h4>Recommendations from Fiery</h4></div>
            <div class="col-lg-12 col-12 m-2"><p style="margin-left: 5px">Choose the right ones from the specially selected courses to be profi gamer!</p></div>

            <div class="col-lg-12 col-12" style="margin-top: 5em"><h4>Strategy</h4></div>
            <div class="card-deck">
                <div class="card">
                    <img class="card-img-top" src="img/d7b9ec22-fcd5-41e9-9b0a-1e192832e95d.dota-2-header.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">Dota</h5>
                        <p class="card-text">Dota description</p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted">Created 3 months ago</small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm">Тіркелу</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/6eace311-0eeb-4730-b0a9-8b0dfa569568.CSGO.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">CS</h5>
                        <p class="card-text">CS description</p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted">Created 2 months ago</small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm">Тіркелу</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/a0b04aaf-f408-4b32-bee2-93bd51de057e.arctic-fox-animals-eyes-selective-wallpaper.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">Fox</h5>
                        <p class="card-text">Fox description</p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted">Created 1 weeks ago</small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm">Тіркелу</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/6eace311-0eeb-4730-b0a9-8b0dfa569568.CSGO.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">CS</h5>
                        <p class="card-text">CS description</p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted">Created 2 months ago</small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm">Тіркелу</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-12 col-12" style="margin-top: 5em"><h4>Shooter</h4></div>
            <div class="card-deck">
                <div class="card">
                    <img class="card-img-top" src="img/d7b9ec22-fcd5-41e9-9b0a-1e192832e95d.dota-2-header.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">Dota</h5>
                        <p class="card-text">Dota description</p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted">Created 3 months ago</small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm">Тіркелу</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/6eace311-0eeb-4730-b0a9-8b0dfa569568.CSGO.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">CS</h5>
                        <p class="card-text">CS description</p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted">Created 2 months ago</small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm">Тіркелу</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/a0b04aaf-f408-4b32-bee2-93bd51de057e.arctic-fox-animals-eyes-selective-wallpaper.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">Fox</h5>
                        <p class="card-text">Fox description</p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted">Created 1 weeks ago</small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm">Тіркелу</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/6eace311-0eeb-4730-b0a9-8b0dfa569568.CSGO.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">CS</h5>
                        <p class="card-text">CS description</p>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted">Created 2 months ago</small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm">Тіркелу</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 col-12 text-center" style="margin-top: 5em">
                <a href="/course" class="btn btn-primary btn-lg">See all courses</a>
            </div>

        </div>
    </div>
</div>
<div class="col-lg-12 col-12 mt-5" style="background: aliceblue">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-12 col-12 mt-5"><h4>Special discounts</h4></div>
            <div class="col-lg-12 col-12 m-2"><p style="margin-left: 5px">Subscribe now to not miss out on the discount!</p></div>

            <div class="col-lg-12 col-12" style="margin-top: 5em"><h4>Hot discounts</h4></div>
            <div class="card-deck">
                <div class="card">
                    <img class="card-img-top" src="img/d7b9ec22-fcd5-41e9-9b0a-1e192832e95d.dota-2-header.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">Dota</h5>
                        <p class="card-text">Dota description</p>
                        <div class="row justify-content-center">
                            <p style="font-size: 20px"><del><i>4500 kzt</i></del>  <b>2250 kzt</b></p>
                            <img class="card-img-top ml-3" style="height: 35px; width: 35px" src="img/discount.png" alt="Course image">
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row justify-content-center">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted">Created 3 months ago</small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm">Тіркелу</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/6eace311-0eeb-4730-b0a9-8b0dfa569568.CSGO.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">CS</h5>
                        <p class="card-text">CS description</p>
                        <div class="row justify-content-center">
                            <p style="font-size: 20px"><del><i>6000 kzt</i></del>  <b>4200 kzt</b></p>
                            <img class="card-img-top ml-3" style="height: 35px; width: 35px" src="img/discount.png" alt="Course image">
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted">Created 2 months ago</small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm">Тіркелу</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/a0b04aaf-f408-4b32-bee2-93bd51de057e.arctic-fox-animals-eyes-selective-wallpaper.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">Fox</h5>
                        <p class="card-text">Fox description</p>
                        <div class="row justify-content-center">
                            <p style="font-size: 20px"><del><i>2500 kzt</i></del>  <b>1950 kzt</b></p>
                            <img class="card-img-top ml-3" style="height: 35px; width: 35px" src="img/discount.png" alt="Course image">
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted">Created 1 weeks ago</small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm">Тіркелу</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <img class="card-img-top" src="img/6eace311-0eeb-4730-b0a9-8b0dfa569568.CSGO.jpg" alt="Course image">
                    <div class="card-body">
                        <h5 class="card-title">CS</h5>
                        <p class="card-text">CS description</p>
                        <div class="row justify-content-center">
                            <p style="font-size: 20px"><del><i>6000 kzt</i></del>  <b>4200 kzt</b></p>
                            <img class="card-img-top ml-3" style="height: 35px; width: 35px" src="img/discount.png" alt="Course image">
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-8 col-8">
                                <small class="text-muted">Created 2 months ago</small>
                            </div>
                            <div class="col-lg-4 col-4" style="padding-left: 1px">
                                <a href="/student/my-courses" class="btn btn-primary btn-sm">Тіркелу</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 col-12 text-center mb-5" style="margin-top: 5em">
                <a href="/course" class="btn btn-primary btn-lg">See all courses</a>
            </div>

        </div>
    </div>
</div>
<section class="mt-5 pt-5 pb-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-6"><h4>Our teachers</h4></div>
            <div class="col-6 text-right">
                <a class="btn btn-primary mb-3 mr-1" href="#carouselExampleIndicators2" role="button" data-slide="prev">
                    <i class="fa fa-arrow-left"></i>
                </a>
                <a class="btn btn-primary mb-3 " href="#carouselExampleIndicators2" role="button" data-slide="next">
                    <i class="fa fa-arrow-right"></i>
                </a>
            </div>
            <div class="col-lg-12 col-12 ml-2"><p style="margin-left: 5px">Best teachers ever!</p></div>
            <div class="col-12 mt-5">
                <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">

                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row">

                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 1.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title">Zhappar Nurdaulet</h4>
                                            <p class="card-text">Teacher course "Dota 2"</p>

                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 2.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title">Nogay Nursultan</h4>
                                            <p class="card-text">Teacher course "CS GO"</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 3.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title">Zhansultan Nagashybayev</h4>
                                            <p class="card-text">Teacher course "CS GO"</p>

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
                                            <p class="card-text">Teacher course "CS GO"</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 3.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title">Oleksandr Kostyliev</h4>
                                            <p class="card-text">Teacher course "CS GO"</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 1.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title">Zhappar Nurdaulet</h4>
                                            <p class="card-text">Teacher course "Dota 2"</p>

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
                                            <h4 class="card-title">Oleksandr Kostyliev</h4>
                                            <p class="card-text">Teacher course "CS GO"</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 1.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title">Zhappar Nurdaulet</h4>
                                            <p class="card-text">Teacher course "Dota 2"</p>

                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="card">
                                        <img class="img-fluid" alt="100%x280" src="/img/Navi Teacher 2.png">
                                        <div class="card-body text-center">
                                            <h4 class="card-title">Nogay Nursultan</h4>
                                            <p class="card-text">Teacher course "CS GO"</p>

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