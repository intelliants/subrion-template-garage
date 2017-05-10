{if isset($news_latest) && $news_latest}
    <div class="ia-items latest-news">
        {foreach $news_latest as $entry}
            <div class="media ia-item">
                <a class="pull-left" href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.alias}">
                    {printImage imgfile=$entry.image|default:'' width=50 title=$entry.title}
                </a>
                <div class="media-body">
                    <div class="latest-news__date-added">{$entry.date|date_format:$core.config.date_format}</div>
                    <h5 class="media-heading"><a href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.alias}">{$entry.title}</a></h5>
                </div>
            </div>
        {/foreach}
    </div>
{/if}