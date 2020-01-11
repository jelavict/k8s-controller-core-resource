# ROOT_PACKAGE :: the package (relative to $GOPATH/src) that is the target for code generation
ROOT_PACKAGE="github.com/jelavict/k8s-controller-core-resource"
# CUSTOM_RESOURCE_NAME :: the name of the custom resource that we're generating client code for
CUSTOM_RESOURCE_NAME="myresource"
# CUSTOM_RESOURCE_VERSION :: the version of the resource
CUSTOM_RESOURCE_VERSION="v1"

# retrieve the code-generator scripts and bins
#go get k8s.io/code-generator
#go get k8s.io/apimachinery
#go get k8s.io/gengo
#go get -u golang.org/x/tools/cmd/goimports
#go get k8s.io/klog
cd $GOPATH/src/k8s.io/code-generator

# run the code-generator entrypoint script
./generate-groups.sh all "$ROOT_PACKAGE/pkg/client" "$ROOT_PACKAGE/pkg/apis" "$CUSTOM_RESOURCE_NAME:$CUSTOM_RESOURCE_VERSION"

# view the newly generated files
tree $GOPATH/src/$ROOT_PACKAGE/pkg/client
# pkg/client/
# +¦¦ clientset
# -   L¦¦ versioned
# -       +¦¦ clientset.go
# -       +¦¦ doc.go
# -       +¦¦ fake
# -       -   +¦¦ clientset_generated.go
# -       -   +¦¦ doc.go
# -       -   L¦¦ register.go
# -       +¦¦ scheme
# -       -   +¦¦ doc.go
# -       -   L¦¦ register.go
# -       L¦¦ typed
# -           L¦¦ myresource
# -               L¦¦ v1
# -                   +¦¦ doc.go
# -                   +¦¦ fake
# -                   -   +¦¦ doc.go
# -                   -   +¦¦ fake_myresource_client.go
# -                   -   L¦¦ fake_myresource.go
# -                   +¦¦ generated_expansion.go
# -                   +¦¦ myresource_client.go
# -                   L¦¦ myresource.go
# +¦¦ informers
# -   L¦¦ externalversions
# -       +¦¦ factory.go
# -       +¦¦ generic.go
# -       +¦¦ internalinterfaces
# -       -   L¦¦ factory_interfaces.go
# -       L¦¦ myresource
# -           +¦¦ interface.go
# -           L¦¦ v1
# -               +¦¦ interface.go
# -               L¦¦ myresource.go
# L¦¦ listers
#     L¦¦ myresource
#         L¦¦ v1
#             +¦¦ expansion_generated.go
#             L¦¦ myresource.go
# 
# 16 directories, 22 files
