{if isset($news_latest) && $news_latest}
    <div class="ia-items latest-news">
        {foreach $news_latest as $entry}
            <div class="media ia-item">
                <a class="pull-left" href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.slug}">
                    {ia_image file=$entry.pictures[0] width=50 type='thumbnail' title=$entry.title}
                </a>
                <div class="media-body">
                    <div class="latest-news__date-added">{$entry.date_added|date_format:$core.config.date_format}</div>
                    <h5 class="media-heading"><a href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.slug}">{$entry.title}</a></h5>
                </div>
            </div>
        {/foreach}
    </div>
{/if}