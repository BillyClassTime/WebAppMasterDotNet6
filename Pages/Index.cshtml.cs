using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace GitWebAppMaster.Pages;

public class IndexModel : PageModel
{
    private readonly ILogger<IndexModel> _logger;

    private readonly IConfiguration Configuration;

    public IndexModel(ILogger<IndexModel> logger,IConfiguration configuration)
    {
        _logger = logger;
        Configuration = configuration;
    }

    public void OnGet()
    {
        ViewData["AppTitle"] = Configuration["AppTitle"];
        ViewData["Copyrigth"] = DateTime.Now.Year;
    }
}
