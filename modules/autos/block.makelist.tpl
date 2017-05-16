{if !empty($car_blocks_data.make)}
    <div class="row">
        {foreach $car_blocks_data.make as $make}
            {if $make.priority}
                <div class="col-md-4">
                    <a href="{$make.url}">
                        <img src="{$core.page.nonProtocolUrl}uploads/{$make.icon.path}" alt="{$make.title|escape}">
                        <div>
                            <span>{$make.title|escape}</span>
                            <span>{$make.num|default:0}</span>
                        </div>
                    </a>
                </div>
            {/if}
        {/foreach}
    </div>
{/if}