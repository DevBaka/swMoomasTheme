{extends file="parent:frontend/detail/tabs.tpl"}

{block name="frontend_detail_tabs_navigation_inner"}
    {block name="fronend_detail_tabs_foo"}
        <a href="#" class="tab--link" title="Handelsmöglichkeiten" data-tabName="foo">Handels möglichkeiten</a>
    {/block}
    {$smarty.block.parent}

{/block}

{block name="frontend_detail_tabs_content_inner"}

    <div class="tab--container">

        <div class="tab--header">
            <a class="tab--title" title="Handelsmöglichkeiten">Handel möglichkeiten</a>
        </div>
        <div class="tab--preview">
            <p>Fooo Previeweeeea!</p>
        </div>
        <div class="tab--content">
            <p>Hier finden Sie eine auflistung an Handelsmöglichkeiten</p>
            <ul>
                <li>Auktionshaus</li>
                <li>Post</li>
                <li>Face2Face</li>
            </ul>
        </div>

    </div>
    {$smarty.block.parent}

{/block}