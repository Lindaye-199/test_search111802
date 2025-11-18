import allure
from playwright.sync_api import Page

@allure.feature("淘宝搜索功能")
@allure.story("筛选工业品")
def test_filter(page: Page):
    page.goto("http://taobao.com")
    with allure.step("查找工业品链接"):
        links = page.locator('[aria-label="查看更多"]').filter(has_text="工业品").get_by_role("link").all_text_contents()
    with allure.step("断言最后一个链接为定制"):
        assert links[-1] == "定制"
