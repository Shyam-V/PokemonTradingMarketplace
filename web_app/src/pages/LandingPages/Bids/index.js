import { useEffect,useState } from "react";
import Grid from "@mui/material/Grid";
import React, { Component } from 'react';
import { useParams } from "react-router-dom";
import { useGetDataOne } from "../../../hooks/useGetData";

// Material Kit 2 React components
import MKBox from "components/MKBox";
import MKInput from "components/MKInput";
import MKButton from "components/MKButton";
import MKTypography from "components/MKTypography";

import { getFirestore,collection, getDocs,doc,getDoc } from "firebase/firestore"

// Image
import userEvent from "@testing-library/user-event";


function BidsPage()  {
  const params = useParams();
  const[isLoading,setIsLoading] = useState(true)
  const[bgImage,setbgImage]  = useState("")

  useEffect(async() =>{
    const db = getFirestore();
    const docRef = doc(db, "Cards", params.id);
    const docSnap = await getDoc(docRef);

    if (docSnap.exists()) {
    setbgImage(docSnap.data().images.large)
    setIsLoading(false)
    } else {
    console.log("No such document!");
    }

  },[])

  if(!isLoading){
    return (
      <>
        <Grid container spacing={3} alignItems="center">
          <Grid item xs={12} lg={6}>
            <MKBox
              display={{ xs: "none", lg: "flex" }}
              width="calc(100% - 2rem)"
              height="calc(100vh - 2rem)"
              borderRadius="lg"
              ml={2}
              mt={2}
              sx={{ backgroundImage: `url(${bgImage})` }}
            />
          </Grid>
          <Grid
            item
            xs={12}
            sm={10}
            md={7}
            lg={6}
            xl={4}
            ml={{ xs: "auto", lg: 6 }}
            mr={{ xs: "auto", lg: 6 }}
          >
            <MKBox
              bgColor="white"
              borderRadius="xl"
              shadow="lg"
              display="flex"
              flexDirection="column"
              justifyContent="center"
              mt={{ xs: 20, sm: 18, md: 20 }}
              mb={{ xs: 20, sm: 18, md: 20 }}
              mx={3}
            >
              <MKBox
                variant="gradient"
                bgColor="info"
                coloredShadow="info"
                borderRadius="lg"
                p={2}
                mx={2}
                mt={-3}
              >
                <MKTypography variant="h3" color="white">
                  Contact us
                </MKTypography>
              </MKBox>
              <MKBox p={3}>
                <MKTypography variant="body2" color="text" mb={3}>
                   For further questions, includng partnership opportunities, please email
                  hello@creative-tim.com or contact using our contact form.
                </MKTypography>
                <MKBox width="100%" component="form" method="post" autocomplete="off">
                  <Grid container spacing={3}>
                    <Grid item xs={12} md={6}>
                      <MKInput
                        variant="standard"
                        label="Full Name"
                        InputLabelProps={{ shrink: true }}
                        fullWidth
                      />
                    </Grid>
                    <Grid item xs={12} md={6}>
                      <MKInput
                        type="email"
                        variant="standard"
                        label="Email"
                        InputLabelProps={{ shrink: true }}
                        fullWidth
                      />
                    </Grid>
                    <Grid item xs={12}>
                      <MKInput
                        variant="standard"
                        label="What can we help you?"
                        placeholder="Describe your problem in at least 250 characters"
                        InputLabelProps={{ shrink: true }}
                        multiline
                        fullWidth
                        rows={6}
                      />
                    </Grid>
                  </Grid>
                  <Grid container item justifyContent="center" xs={12} mt={5} mb={2}>
                    <MKButton type="submit" variant="gradient" color="info">
                      Place Bid
                    </MKButton>
                  </Grid>
                </MKBox>
              </MKBox>
            </MKBox>
          </Grid>
        </Grid>
      </>
    );
}
else{
  return(
    <div>
    </div>
  )
}
}


export default BidsPage;
