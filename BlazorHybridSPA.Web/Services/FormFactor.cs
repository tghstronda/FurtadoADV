namespace BlazorHybridSPA.Shared.Services
{
    public class FormFactor : IFormFactor
    {
        public string GetFormFactor() => "Hybrid";
        public string GetPlatform() => System.Runtime.InteropServices.RuntimeInformation.OSDescription;
    }
}
