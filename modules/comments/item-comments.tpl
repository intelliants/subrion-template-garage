{if isset($comments) && isset($item)}
    <div class="row">
        <div class="col-md-6">
            {ia_block title={lang key='comments'} style='movable' name='comments_form' id='comments-list'}
                {if !empty($comments)}
                    <div id="comments-container">
                        <div class="comments-list">
                            {foreach $comments as $comment name='comments_list'}
                                {include file="modules/comments/templates/front/comment.tpl"}
                            {/foreach}
                        </div>
                    </div>
                {else}
                    <div class="alert alert-info">{lang key='no_comments'}</div>
                {/if}
            {/ia_block}
        </div>
        <div class="col-md-6">
            {ia_block title={lang key='leave_your_comment'} style='movable' name='comments_form' id='comments-form'}
                <div class="alert alert-danger hidden" id="comments-alert"></div>
                {if !$core.config.comments_allow_guests && empty($member)}
                    <div class="alert alert-info">{lang key="error_comment_logged"}</div>
                {else}
                    <form action="" method="post" id="comment-form">
                        {preventCsrf}
                        {if $member}
                            <input type="hidden" name="author" value="{$member.username}">
                            <input type="hidden" name="email" value="{$member.email}">
                        {else}
                            <div class="form-group">
                                <label for="author-name">{lang key="comment_author"}<span class="required">*</span></label>
                                <input type="text" id="author-name" class="form-control" name="author" size="25" value="">
                            </div>
                            <div class="form-group">
                                <label for="author-email">{lang key="author_email"}<span class="required">*</span></label>
                                <input type="text" class="form-control" name="email" size="25" value="">
                            </div>
                            <div class="form-group">
                                <label for="author-url">{lang key="author_url"}</label>
                                <input type="text" id="author-url" class="form-control" name="url" size="25" value="">
                            </div>
                        {/if}
                        <div class="form-group">
                            {if !$member}
                                <label for="comment-body">{lang key="comment"}<span class="required">*</span></label>
                            {/if}
                            {if !$core.config.comments_allow_wysiwyg}
                                <textarea name="comment_body" class="form-control" id="comment-body" rows="6"></textarea>
                            {else}
                                {ia_wysiwyg name='comment_body' id='comment_form'}
                                {ia_print_js files='ckeditor/ckeditor'}
                            {/if}
                        </div>
                        <div class="form-group" id="comments-captcha">
                            {include file='captcha.tpl'}
                        </div>
                        <div class="alert" id="comments-alert" style="display: none;">
                            <ul class="unstyled"></ul>
                        </div>
                        <input type="hidden" name="item_id" value="{$item.id}">
                        <input type="hidden" name="item" value="{$item.item}">
                        <button class="btn btn-dark btn-rounded" type="button" id="leave_comment" name="add_comment">{lang key='leave_comment'}</button>
                    </form>
                    {ia_print_js files='jquery/plugins/jquery.textcounter'}
                {/if}
            {/ia_block}
        </div>
    </div>

    {ia_print_js files='_IA_URL_modules/comments/js/frontend/comments'}
{/if}