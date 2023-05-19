using System.Diagnostics;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapRazorPages();

app.MapGet("/CPU", () => CPU());
app.MapGet("/RAMFREE", () => RAMFree());

app.Run();


float CPU()
{
    return float.Parse(Execute("sh", "cpu.sh"));
}
float RAMFree()
{
    return float.Parse(Execute("sh", "ram.sh"));
}

string Execute(string command, string arguments)
{
    string output = string.Empty;

    try
    {
        ProcessStartInfo startInfo = new ProcessStartInfo();
        startInfo.FileName = command;
        startInfo.Arguments = arguments;
        startInfo.RedirectStandardOutput = true;
        startInfo.UseShellExecute = false;
        startInfo.CreateNoWindow = true;

        using (Process process = new Process())
        {
            process.StartInfo = startInfo;
            process.Start();

            output = process.StandardOutput.ReadToEnd();
            process.WaitForExit();
        }
    }
    catch (Exception ex)
    {
        Console.WriteLine("Error executing command: " + ex.Message);
    }

    return output;
    }