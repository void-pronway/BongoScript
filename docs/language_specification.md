# BongoScript Language Specification v1.0

## Program Structure

Every BongoScript program must start with:

শুরু

and end with:

শেষ

Example:

শুরু

লাইট চালু;

শেষ


## Device Commands

A device command has this form:

DEVICE ACTION;

Supported devices:

- লাইট
- ফ্যান
- এসি

Supported actions:

- চালু
- বন্ধ

Examples:

লাইট চালু;
ফ্যান বন্ধ;
এসি চালু;


## Temperature Condition

BongoScript supports a simple temperature condition.

Format:

তাপমাত্রা NUMBER হলে
DEVICE ACTION;

Example:

তাপমাত্রা ৩০ হলে
ফ্যান চালু;