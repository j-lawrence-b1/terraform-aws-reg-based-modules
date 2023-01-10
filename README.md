# terraform-aws-reg-based-modules
Module hierarchy sourcing from the Terraform registry. Intent is to simplify imputs for simple use cases.

Design goals:
1. Source from publicly-available, "official", or otherwise high quality terraform.io modules.
2. terraform and terragrunt compatibility.
3. Minimize cloud footprint: Turn off all the features I don't need.
4. Regard for best practices (cit. needed).

## Attributions
This repo sources official modules hosted on the [Terraform registry](https://registry.terraform.io). Their license is [here](https://registry.terraform.io/terms). Other licenses may apply.
