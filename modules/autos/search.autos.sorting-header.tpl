<input type="hidden" id="js-default-search-options" data-field="date" data-order="desc">
<div class="ia-sorting">
    <div class="pull-left hidden-xs">
        {lang key='num_results_found'}
    </div>
    <div class="pull-right">
        <div class="ia-sorting__field">
            {lang key='sort_by'}:
            <div class="btn-group">
                <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
                    <span id="js-sorting-option-field">{lang key='date'}</span>
                    <span class="fa fa-angle-down"></span>
                </a>
                <ul class="dropdown-menu js-autos-sorting-options">
                    <li><a href="#" data-field="title"><span class="fa fa-font"></span> {lang key='title'}</a></li>
                    <li><a href="#" data-field="price"><span class="fa fa-dollar"></span> {lang key='price'}</a></li>
                    <li><a href="#" data-field="year"><span class="fa fa-calendar"></span> {lang key='field_auto_release_year'}</a></li>
                    <li><a href="#" data-field="date"><span class="fa fa-clock-o"></span> {lang key='date'}</a></li>
                </ul>
            </div>
        </div>

        <ul class="ia-sorting__direction js-autos-sorting-direction">
            <li>
                <a href="#" data-order="asc">
                    <span class="fa fa-sort-amount-asc"></span>
                </a>
            </li>
            <li>
                <a href="#" class="active" data-order="desc">
                    <span class="fa fa-sort-amount-desc"></span>
                </a>
            </li>
        </ul>
    </div>
</div>

{ia_add_js}
$(function() {
    $('.js-autos-sorting-options a').on('click', function(e) {
        e.preventDefault();

        var data = $(this).data();

        if (undefined !== data.field)
            $('#js-sorting-option-field').text($(this).text());
        else if (undefined !== data.order)
            $('#js-sorting-option-order').text($(this).text());
    });

    $('.js-autos-sorting-direction a').on('click', function(e) {
        e.preventDefault();

        $('.js-autos-sorting-direction a').removeClass('active');
        $(this).addClass('active');
    });
});
{/ia_add_js}