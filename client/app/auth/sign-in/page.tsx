"use client";

import { LoginForm } from "@/components/login-form";
import { authClient } from "@/lib/auth-client";
import { useRouter } from "next/navigation";
import { Spinner } from "@/components/ui/spinner";
import React from "react";

const Page = () => {
  const { data, isPending } = authClient.useSession();
  const router = useRouter();

  if (isPending) {
    return (
      <div className="flex flex-col items-center justify-center h-screen">
        <Spinner />
      </div>
    );
  }

  // If user is already logged in, redirect to home page
  if (data?.session && data?.user) {
    router.push("/"); // Redirect to home, not sign-in
    return null; // Return null while redirecting
  }

  // Only show login form if user is NOT logged in
  return (
    <>
      <LoginForm />
    </>
  );
};

export default Page;