# PushLayer Test

A very simple demo iOS app showing how to send and receive push notifications via PushLayer.

## Getting Started

First, clone the repo, then be sure to get submodules (the demo app uses AFNetworking):

```shell
git clone git@github.com:draconis-software/pushlayer-test.git
cd pushlayer-test
git submodule update --init
```

## PushLayer Credentials

Next, you'll need to get your application ID from PushLayer. Check out the documentation on how to setup your APNS entitlements, adding your certificate to PushLayer, and then grabbing your application ID with the [PushLayer Docs](https://www.pushlayer.com/pages/docs#SetupandAPNSentitlements).

Once you have your application ID, add it to line 15 of PushLayerTest/ViewController.m

## Building

Lastly, build and run the app on your device (push notifications aren't available in the simulator). When the app is running, push the button and wait a few moments. Hopefully, if everything works correctly, you'll get a shiny blue notification!
