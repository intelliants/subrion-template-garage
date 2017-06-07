{if !empty($car_blocks_data.make)}
    <div class="make-list">
        {foreach $car_blocks_data.make as $make}
            {if $make@iteration <= 10}
                <a href="{$make.url}" class="make-list__item">
                    <span class="make-list__item__image">
                        <img src="{$core.page.nonProtocolUrl}uploads/{$make.icon.path}" alt="{$make.title|escape}">
                    </span>

                    <span class="make-list__item__title">
                        {$make.title|escape} {$make.num|default:0}
                    </span>
                </a>
            {/if}
        {/foreach}
    </div>
{/if}