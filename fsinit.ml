let _ =
  let project_name = Sys.argv.(1) in
  let project_type = Sys.argv.(2) in
  let test_framework = Sys.argv.(3) in

  [
    Format.sprintf "mkdir %s && cd %s && mkdir %s && mkdir %s.Tests" project_name project_name project_name project_name;
    Format.sprintf "cd %s && dotnet new %s -lang=\"F#\" && cd .. " project_name project_type;
    Format.sprintf "cd %s.Tests && dotnet new %s -lang=\"F#\" && dotnet add reference ../%s && cd .." project_name test_framework project_name;
    Format.sprintf "dotnet new sln && dotnet sln add %s && dotnet sln add %s.Tests" project_name project_name;
    Format.sprintf "dotnet build && dotnet test"
  ] |> String.concat " && " |> Sys.command |> ignore
