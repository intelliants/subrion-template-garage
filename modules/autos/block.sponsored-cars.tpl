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
                    dots: false,
                    margin: 10,
                    nav: true,
                    loop: true,
                    autoplay: true,
                    autoplayTimeout: 3000,
                    navText: ['<span class="fa fa-angle-left"></span>','<span class="fa fa-angle-right"></span>'],
                    responsive: {
                        0: {
                            items: 1
                        },
                        480: {
                            items: 2
                        },
                        640: {
                            items: 2
                        },
                        768: {
                            items: 3
                        },
                        960: {
                            items: 4
                        },
                        1200: {
                            items: 5
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
{/if}