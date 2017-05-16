{if !empty($car_blocks_data.recent)}
    <div class="ia-cards">
        <div class="ia-cards__items">
            <div class="row">
                {foreach $car_blocks_data.recent as $listing}
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
    </div>

    {ia_print_js files='_IA_URL_modules/autos/js/front/index, _IA_URL_modules/autos/js/front/comparison'}
{/if}