{if !empty($car_blocks_data.sponsored)}
    {if count($car_blocks_data.sponsored) > 5}
        <div class="ia-cards__items sponsored-cars js-carousel-sponsored-cars">
            {foreach $car_blocks_data.sponsored as $listing}
                {include 'extra:autos/list-autos'}
            {/foreach}
        </div>
        {ia_add_js}
            $(function() {
                var owlOptions = {
                    center: true,
                    dots: false,
                    nav: true,
                    loop: true,
                    autoplay: true,
                    autoplayTimeout: 3000,
                    autoplayHoverPause: true,
                    navText: ['<span class="fa fa-angle-left"></span>','<span class="fa fa-angle-right"></span>'],
                    responsive: {
                        0: {
                            items: 1
                        },
                        880: {
                            items: 2
                        },
                        993: {
                            items: 4
                        },
                        1200: {
                            items: 5
                        },
                        1400: {
                            items: 6
                        }
                    }
                }

                $('.js-carousel-sponsored-cars').owlCarousel(owlOptions);
            });
        {/ia_add_js}
    {else}
        <div class="container">
            <div class="row">
                {foreach $car_blocks_data.sponsored as $listing}
                    <div class="col-md-3">
                        {include 'extra:autos/list-autos'}
                    </div>

                    {if $listing@iteration % 4 == 0 && !$listing@last}
                        </div>
                        <div class="row">
                    {/if}
                {/foreach}
            </div>
        </div>
    {/if}

    {ia_print_js files='_IA_URL_modules/autos/js/front/index, _IA_URL_modules/autos/js/front/comparison'}
{/if}