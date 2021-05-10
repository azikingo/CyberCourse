<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
<div class="col-lg-12 col-12" style="background: aliceblue">
    <div class="container">
        <div>
            <#--            justify-content-center   degendi bilet shygarsyn barin ortasyna aparad, es 4e ap tstai sal-->
            <#--            mynda qalagan narsendi qosa ber-->

            <br /><br />
            <h1><#if .locale = 'kz'>
                    Fiery Онлайн курстары туралы
                <#elseIf .locale = 'ru'>
                    Об онлайн-курсах Fiery
                <#else>
                    About Fiery online courses
                </#if></h1>
            <br />
            <img width="100%" name="final" alt="final" src="https://xn--90aihhxfgcgn.xn--p1ai/wp-content/uploads/2020/04/3-950x537.png" />
            <br /><br /><br />
            <h2><#if .locale = 'kz'>
                    ӘЛЕМНІҢ ҮЗДІК ОЙЫНШЫЛАРЫНЫҢ САБАҚТАРЫ
                <#elseIf .locale = 'ru'>
                    ЗАНЯТИЯ ОТ ЛУЧШИХ ИГРОКОВ МИРА
                <#else>
                    CLASSES FROM THE WORLDS BEST PLAYERS
                </#if></h2>
            <br />
            <p><#if .locale = 'kz'>
                    Сізбен және басқа қауымдастықпен бірге біз Dota-да әлемдегі ең жақсы таланттарды табамыз және әр сыныпты пайдаланушылардың көпшілігі белгілі бір ойыншыдан білгісі келетін нәрсеге Мұқият бейімдейміз. Әр сабақ +2 сағатқа созылады, құпия стратегияларға, кеңестер мен амалдарға және басқаларға толы - мұның бәрі сіздің ойыңыздағы біліміңізді арттырып, мансап сатысына көтерілу үшін жасалады.
                <#elseIf .locale = 'ru'>
                    Вместе с вами и остальным сообществом мы находим лучшие в мире таланты в Dota и тщательно адаптируем каждый класс к тому, что большинство наших пользователей хотят узнать от конкретного игрока. Каждое занятие длится +2 часа, наполненных секретными стратегиями, советами и хитростями и многим другим - все это сделано для того, чтобы вы могли увеличить свои знания в игре и подняться по служебной лестнице.
                <#else>
                    Together with you and the rest of the community, we find the world's best Dota talents and carefully tailor each class to what most of our users want to learn from that specific player. Each class is +2 hours filled with secret strategies, tips & tricks and much more - all made for you to increase your in-game knowledge and climb the ranks.
                </#if></p>
            <p><#if .locale = 'kz'>
                    * * N0tail, Topson, Cr1t, Boxi, Nikobaby және басқалардан үйреніңіз
                <#elseIf .locale = 'ru'>
                    •  Учитесь у N0tail, Topson, Cr1t, Boxi, Nikobaby и других
                <#else>
                    • Learn from N0tail, Topson, Cr1t, Boxi, Nikobaby & More
                </#if></p>
            <p><#if .locale = 'kz'>
                    * Әр позиция үшін ерекше сабақтар
                <#elseIf .locale = 'ru'>
                    • Уникальные классы для каждой позиции
                <#else>
                    • Unique classes for every position
                </#if></p>
            <p><#if .locale = 'kz'>
                    • Кәсіби мамандардың ойлау процесіне кіріп, тез арада MMR алыңыз
                <#elseIf .locale = 'ru'>
                    • Войдите в мыслительный процесс профессионалов и быстро получите MMR
                <#else>
                    • Get inside the pros thought process and gain MMR fast
                </#if></p>

            <button class="btn btn-primary mb-2" type="button" onclick="document.location='/course'"><#if .locale = 'kz'>
                    ТЕГІН БАСТАҢЫЗ
            <#elseIf .locale = 'ru'>
                НАЧНИТЕ БЕСПЛАТНО
            <#else>
                    START FOR FREE
                </#if></button>
            <br/><br/><br/>

            <img width="100%" src="http://go2load.com/uploads/posts/2015-03/1427236786_navichamps_1040-720x320.jpg" />
            <br /><br /><br />

            <h2><#if .locale = 'kz'>
                    ЭКСКЛЮЗИВТІ ҚАУЫМДАСТЫҚ
            <#elseIf .locale = 'ru'>
                ЭКСКЛЮЗИВНОЕ СООБЩЕСТВО
            <#else>
                    EXCLUSIVE COMMUNITY
                </#if></h2>
            <br />
            <p><#if .locale = 'kz'>
                    Бұл бағдарлама MMR-ді тез арттырғысы келетін Dota 2 ойыншыларына арналған. Біздің барлық Pro Dota 2 мастер-класстарына, кәсіби мамандармен тікелей топтық сессияларға және басқаларға қол жеткізіңіз. Ең жақсы өлім ойыншыларымен және Біздің Discord-дағы кәсіби жаттықтырушылармен тікелей топтық іс-шараларға қосылыңыз.
                <#elseIf .locale = 'ru'>
                    Эта программа специально разработана для игроков в Dota 2, которые хотят быстро увеличить свой MMR. Получите доступ ко всем нашим мастер-классам Pro Dota 2, живым групповым сессиям с профессионалами и многому другому. Присоединяйтесь к живым групповым занятиям с лучшими игроками immortal и нашими профессиональными тренерами на нашем Discord.
                <#else>
                    This program is specifically tailored for the Dota 2 players who want to increase their MMR fast. Get access to all our Pro Dota 2 Masterclasses, live group sessions with pros and much more. Join live group sessions with top immortal players and our pro coaches on our Discord.
                </#if></p>
            <p>• <#if .locale = 'kz'>
                    Кәсіби ойыншылармен тікелей сессиялар
                <#elseIf .locale = 'ru'>
                    Живые сессии с профессиональными игроками
                <#else>
                    Live sessions with professional players
                </#if></p>
            <p><#if .locale = 'kz'>
                    • Сұрақтарыңызды тікелей кәсіби ойыншыларға қойыңыз
                <#elseIf .locale = 'ru'>
                    • Задавайте свои вопросы непосредственно профессиональным игрокам
                <#else>
                    • Ask your questions directly to pro players
                </#if></p>
            <p><#if .locale = 'kz'>
                    • Бейне гайдтар мен ойындарды талдаудың үлкен мұрағаты
                <#elseIf .locale = 'ru'>
                    • Большой архив видеогайдов и анализа игр
                <#else>
                    • Big archive of video guides and game analysis
                </#if></p>

            <button class="btn btn-primary mb-2" type="button" onclick="document.location='/course'"><#if .locale = 'kz'>
                    ТЕГІН БАСТАҢЫЗ
                <#elseIf .locale = 'ru'>
                    НАЧНИТЕ БЕСПЛАТНО
                <#else>
                    START FOR FREE
                </#if></button>
            <br/><br/><br/>

            <img width="100px;" src="https://images.ctfassets.net/tasyjiae7x28/4gPOBEDm0EQsfW2arF9QXu/1e2087c1d3a05101f6830c29aa53860a/navi.png" />
            <img width="100px;" src="https://logowiki.net/uploads/logo/v/virtuspro-1.svg" />
            <img width="100px;" src="https://upload.wikimedia.org/wikipedia/commons/1/12/OG_esports_Logo.png" />
            <img width="100px;" src="https://cdn.escharts.com/uploads/public/5de/859/bf3/5de859bf3943f275038123.png" />
            <br /><br /><br />
            <#--            smelo-->
        </div>
    </div>
</div>
<#include "parts/footer.ftlh">
</@c.page>