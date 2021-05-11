<footer id="footer" class="page-footer font-small blue-grey lighten-5">

    <div style="background-color: #007bff; color:white;">
        <div class="container">

            <div class="row py-4 d-flex justify-content-center">

                <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
                    <h5 class="mb-0"><#if .locale = 'kz'>
                            Бізбен әлеуметтік желілерде хабарласыңыз!
                        <#elseIf .locale = 'ru'>
                            Свяжитесь с нами в социальных сетях!
                        <#else>
                            Get connected with us on social networks!
                        </#if></h5>
                </div>

            </div>

        </div>
    </div>

    <div class="container text-center text-md-left mt-5">

        <div class="row mt-3 dark-grey-text">

            <div class="col-md-3 col-lg-4 col-xl-3 mb-4">

                <h6 class="text-uppercase font-weight-bold" style="color: #3b5998;">Fiery</h6>
                <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p><#if .locale = 'kz'>
                        Киберспорт элитасының жанжалды өмірі туралы жалғыз ақпарат көзі
                    <#elseIf .locale = 'ru'>
                        Ваш единственный источник информации о скандальной жизни элиты киберспорта
                    <#else>
                        Your one and only source into the scandaluos life of cybersport's elite
                    </#if></p>

            </div>

            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

                <h6 class="text-uppercase font-weight-bold" style="color: #3b5998;"><#if .locale = 'kz'>
                        Өнімдер
                    <#elseIf .locale = 'ru'>
                       Продукты
                    <#else>
                        Products
                    </#if></h6>
                <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>
                    <a class="text-info" href="/student/my-courses"><#if .locale = 'kz'>
                            Менің курстарым
                        <#elseIf .locale = 'ru'>
                            Мой Курсы
                        <#else>
                            My Courses
                        </#if></a>
                </p>
                <p>
                    <a class="text-info" href="/course"><#if .locale = 'kz'>
                            Барлық Курстар
                        <#elseIf .locale = 'ru'>
                            Все Курсы
                        <#else>
                           All Сourses
                        </#if></a>
                </p>

            </div>

            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

                <h6 class="text-uppercase font-weight-bold" style="color: #3b5998;"><#if .locale = 'kz'>
                        пайдалы сілтемелер
                    <#elseIf .locale = 'ru'>
                        полезные ссылки
                    <#else>
                        useful links
                    </#if></h6>
                <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>
                    <a class="text-info" href="/contacts">
                        <#if .locale = 'kz'>
                            Байланыстар
                        <#elseIf .locale = 'ru'>
                            Контакты
                        <#else>
                            Contacts
                        </#if></a>
                </p>
                <p>
                    <a class="text-info" href="/about">
                        <#if .locale = 'kz'>
                            Біз туралы
                        <#elseIf .locale = 'ru'>
                            О Нас
                        <#else>
                            About Us
                        </#if></a>
                </p>

            </div>

            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

                <!-- Links -->
                <h6 class="text-uppercase font-weight-bold" style="color: #3b5998;><#if .locale = 'kz'>
                      Бізге хабарласыныз
                    <#elseIf .locale = 'ru'>
                        Свяжитесь с нами
                    <#else>
                       Contact Us
                    </#if>
                </h6>
                <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>
                    <i class="fas fa-home mr-3"></i> Qaskelen, Abylai khan 1/1</p>
                <p>
                    <i class="fas fa-envelope mr-3"></i> fiery.qaz@gmail.com </p>
                <p>
                    <i class="fas fa-phone mr-3"></i> +7 747 130 12 00</p>

            </div>

        </div>

        <div class="row justify-content-center">

            <!-- Facebook -->
            <a class="btn m-2" style="background-color: #3b5998;" target="_blank"
               href="#!" role="button">
                <i class="fab fa-facebook-f" style="color: #f1f1f1"></i>
            </a>

            <!-- Twitter -->
            <a class="btn m-2" style="background-color: #55acee;" target="_blank"
               href="#!" role="button">
                <i class="fab fa-twitter" style="color: #f1f1f1"></i>
            </a>

            <!-- Google -->
            <a class="btn m-2" style="background-color: #dd4b39;" target="_blank"
               href="#!" role="button">
                <i class="fab fa-google" style="color: #f1f1f1"></i>
            </a>

            <!-- Instagram -->
            <a class="btn m-2" style="background-color: #ac2bac;" target="_blank"
               href="https://www.instagram.com/thecybercourse" role="button">
                <i class="fab fa-instagram" style="color: #f1f1f1"></i>
            </a>

            <!-- Linkedin -->
            <a class="btn m-2" style="background-color: #0082ca;" target="_blank"
               href="#!" role="button">
                <i class="fab fa-linkedin-in" style="color: #f1f1f1"></i>
            </a>

        </div>

    </div>

    <div class="footer-copyright text-center text-black-50 py-4">
        <i><b>© 2021 Copyright:</b></i> <a class="text-warning" href="/"><b><i>Fiery</i></b></a>
    </div>

</footer>